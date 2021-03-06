# encoding: utf-8
require File.expand_path(File.dirname(__FILE__)) + '/../test_helper'

# This file is generated by the Ruby Holiday gem.
#
# Definitions loaded: definitions/mt_mt.yaml
class Mt_mtDefinitionTests < Test::Unit::TestCase  # :nodoc:

  def test_mt_mt
    assert_equal "L-Ewwel tas-Sena", (Holidays.on(Date.civil(2017, 1, 1), [:mt_mt])[0] || {})[:name]

    assert_equal "Nawfraġju ta' San Pawl", (Holidays.on(Date.civil(2017, 2, 10), [:mt_mt])[0] || {})[:name]

    assert_equal "San Ġużepp", (Holidays.on(Date.civil(2017, 3, 19), [:mt_mt])[0] || {})[:name]

    assert_equal "Jum il-Ħelsien", (Holidays.on(Date.civil(2017, 3, 31), [:mt_mt])[0] || {})[:name]

    assert_equal "Jum il-Ħaddiem", (Holidays.on(Date.civil(2017, 5, 1), [:mt_mt])[0] || {})[:name]

    assert_equal "Sette Giugno", (Holidays.on(Date.civil(2017, 6, 7), [:mt_mt])[0] || {})[:name]

    assert_equal "L-Imnarja", (Holidays.on(Date.civil(2017, 6, 29), [:mt_mt])[0] || {})[:name]

    assert_equal "Santa Marija", (Holidays.on(Date.civil(2017, 8, 15), [:mt_mt])[0] || {})[:name]

    assert_equal "Jum il-Vitorja", (Holidays.on(Date.civil(2017, 9, 8), [:mt_mt])[0] || {})[:name]

    assert_equal "Jum l-Indipendenza", (Holidays.on(Date.civil(2017, 9, 21), [:mt_mt])[0] || {})[:name]

    assert_equal "Il-Kunċizzjoni", (Holidays.on(Date.civil(2017, 12, 8), [:mt_mt])[0] || {})[:name]

    assert_equal "Jum ir-Repubblika", (Holidays.on(Date.civil(2017, 12, 13), [:mt_mt])[0] || {})[:name]

    assert_equal "Il-Milied", (Holidays.on(Date.civil(2017, 12, 25), [:mt_mt])[0] || {})[:name]

    assert_equal "Il-Ġimgħa l-Kbira", (Holidays.on(Date.civil(2017, 4, 14), [:mt_mt])[0] || {})[:name]
assert_equal "Il-Ġimgħa l-Kbira", (Holidays.on(Date.civil(2018, 3, 30), [:mt_mt])[0] || {})[:name]
assert_equal "Il-Ġimgħa l-Kbira", (Holidays.on(Date.civil(2019, 4, 19), [:mt_mt])[0] || {})[:name]

  end
end
