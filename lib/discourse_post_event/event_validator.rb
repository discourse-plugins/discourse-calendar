# frozen_string_literal: true

module DiscoursePostEvent
  class EventValidator
    def initialize(post)
      @post = post
    end

    def validate_event
      extracted_events = DiscoursePostEvent::EventParser::extract_events(@post)

      if extracted_events.count == 0
        return false
      end

      if extracted_events.count > 1
        @post.errors.add(:base, I18n.t("discourse_post_event.errors.models.event.only_one_event"))
        return false
      end

      if !@post.is_first_post?
        @post.errors.add(:base, I18n.t("discourse_post_event.errors.models.event.must_be_in_first_post"))
        return false
      end

      extracted_event = extracted_events.first

      if @post.acting_user && @post.event
        if !@post.acting_user.can_act_on_event?(@post.event)
          @post.errors.add(:base, I18n.t("discourse_post_event.errors.models.event.acting_user_not_allowed_to_act_on_this_event"))
          return false
        end
      else
        if !@post.acting_user || !@post.acting_user.can_create_event?
          @post.errors.add(:base, I18n.t("discourse_post_event.errors.models.event.acting_user_not_allowed_to_create_event"))
          return false
        end
      end

      if extracted_event[:start].blank? || (DateTime.parse(extracted_event[:start]) rescue nil).nil?
        @post.errors.add(:base, I18n.t("discourse_post_event.errors.models.event.start_must_be_present_and_a_valid_date"))
        return false
      end

      if extracted_event[:end].present? && (DateTime.parse(extracted_event[:end]) rescue nil).nil?
        @post.errors.add(:base, I18n.t("discourse_post_event.errors.models.event.end_must_be_a_valid_date"))
        return false
      end

      if extracted_event[:start].present? && extracted_event[:end].present?
        if Time.parse(extracted_event[:start]) > Time.parse(extracted_event[:end])
          @post.errors.add(:base, I18n.t("discourse_post_event.errors.models.event.ends_at_before_starts_at"))
          return false
        end
      end

      if extracted_event[:name].present? && extracted_event[:name]
        if !(Event::MIN_NAME_LENGTH..Event::MAX_NAME_LENGTH).cover?(extracted_event[:name].length)
          @post.errors.add(:base, I18n.t('discourse_post_event.errors.models.event.name.length', minimum: Event::MIN_NAME_LENGTH, maximum: Event::MAX_NAME_LENGTH))
          return false
        end
      end

      true
    end
  end
end