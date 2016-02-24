require 'minitest/autorun'
require 'minitest/rg'
require_relative '../game'
require_relative '../player'
require_relative '../board'

class TestGamePlay < Minitest::Test

  def setup
    positions = {
     2 => 4,
     7 => -7,
   }

   board = Board.new(9, positions)

   @player1 = Player.new("Val",board.win_tile)
   @player2 = Player.new("Rick",board.win_tile)

   players = [@player1, @player2]

   @game = Game.new(players, board)

  end

  def test_simple_win

    @game.next_turn(6)
    assert_equal(6,@player1.position) # This section is testing that a player can win in a number of steps. Here PLayer1 rolls a 6 

    @game.next_turn(1)                # Then player2 shot, this player only rolls a 1
    assert_equal(1,@player2.position)

    @game.next_turn(2)                # Player 1 rolls a 2 which brings them to the number of the win tile 8
    assert_equal(8,@player1.position)
    
    assert_equal(true, @game.is_won?) # Returns true that the game is won
    assert_equal(@player1, @game.winner) # 

  end

  def test_game_snake_win             # Again this is testsing that the game with one player hiting a snake and the other player reaching the end

    @game.next_turn(6)          
    assert_equal(6,@player1.position)

    @game.next_turn(6)
    assert_equal(6,@player2.position)

    @game.next_turn(1)                  # At this pointplayer1 hits 7 which sends him back to 0 (due to -7 on the index)
    assert_equal(0,@player1.position)

    @game.next_turn(2)
    assert_equal(8,@player2.position)

    assert_equal(true, @game.is_won?) # Player 2 wins!!!
    assert_equal(@player2, @game.winner)

  end

  def test_game_ladder_win  #Fnially this is a test of winning when the ladder is in use. 

    @game.next_turn(2)                #player1 gets to move 4 spaces as they landed on the ladder
    assert_equal(6,@player1.position)

    @game.next_turn(1)
    assert_equal(1,@player2.position)

    @game.next_turn(2)                #They roll a 2 and then they reach the end tile and win
    assert_equal(8,@player1.position)

    assert_equal(true, @game.is_won?)
    assert_equal(@player1, @game.winner)

  end

end