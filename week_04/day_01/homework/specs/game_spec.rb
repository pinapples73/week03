require 'minitest/autorun'
require_relative '../models/game'

class TestGame < Minitest::Test

  def test_rock_versus_scissors
    assert_equal('Player 1 (rock) wins!' , Game.play_game('rock', 'scissors') )
  end

  def test_rock_versus_paper
    assert_equal('Player 2 (paper) wins!' , Game.play_game('rock', 'paper') )
  end

  def test_rock_versus_rock
    assert_equal('draw!' , Game.play_game('rock', 'rock') )
  end
  #--------------------------------------------------

  def test_paper_versus_rock
    assert_equal('Player 1 (paper) wins!' , Game.play_game('paper', 'rock') )
  end

  def test_paper_versus_scissors
    assert_equal('Player 2 (scissors) wins!' , Game.play_game('paper', 'scissors') )
  end

  def test_paper_versus_paper
    assert_equal('draw!' , Game.play_game('paper', 'paper') )
  end
  #--------------------------------------------------

  def test_scissors_versus_rock
    assert_equal('Player 2 (rock) wins!' , Game.play_game('scissors', 'rock') )
  end

  def test_scissors_versus_paper
    assert_equal('Player 1 (scissors) wins!' , Game.play_game('scissors', 'paper') )
  end

  def test_scissors_versus_scissors
    assert_equal('draw!' , Game.play_game('scissors', 'scissors') )
  end
  #--------------------------------------------------

  def test_invalid_input_player1
    assert_equal('players must enter a valid move (rock, paper, scissors)' , Game.play_game('bank', 'rock') )
  end

  def test_invalid_input_player2
    assert_equal('players must enter a valid move (rock, paper, scissors)' , Game.play_game('rock', 'bank') )
  end


end
