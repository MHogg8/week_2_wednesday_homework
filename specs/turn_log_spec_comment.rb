require 'minitest/autorun'
require 'minitest/rg'
require_relative('../turn_log')


class TestTurnLog < Minitest::Test

  def setup
    @turn_log1 = TurnLog.new(player: "Valerie", roll: 7, modifier: -7)
    @turn_log2 = TurnLog.new(player: "Rick", roll:2, modifier:4)
    @turn_log3 = TurnLog.new(player: "Valerie", roll:1, modifier:0)
  end

  def test_has_player
    assert_equal("Valerie",@turn_log1.player)
  end

  def test_has_modifier
    assert_equal(-7,@turn_log1.modifier)
  end

  def test_has_roll
    assert_equal("Valerie",@turn_log1.player)
  end

  def test_has_snake_modifier_type
    assert_equal(:snake, @turn_log1.modifier_type)  #modifier relates to the turn_log1 where there player drops 7 spaces
  end

  def test_has_ladder_modifier_type                 #modifier here relates to turn_log2 in def setup here the player hits a ladder and goes up 4
    assert_equal(:ladder, @turn_log2.modifier_type)
  end

  def has_space_modifier_type                       #modifier here relates to turn_log3 the player  land on a modifier square of type space where no spaces are added to the player
    assert_equal(:space, @turn_log3.modifier_type)
  end
end