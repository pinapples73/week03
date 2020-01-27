class Game

  def self.play_game(player1, player2)
    if player1 =='rock'
      if player2 == 'scissors'
        return 'Player 1 (rock) wins!'
      elsif player2 == 'paper'
        return 'Player 2 (paper) wins!'
      elsif player2 == 'rock'
        return 'draw!'
      end
    end

    if player1 =='paper'
      if player2 == 'rock'
        return 'Player 1 (paper) wins!'
      elsif player2 == 'scissors'
        return 'Player 2 (scissors) wins!'
      elsif player2 == 'paper'
        return 'draw!'
      end
    end

    if player1 =='scissors'
      if player2 == 'rock'
        return 'Player 2 (rock) wins!'
      elsif player2 == 'paper'
        return 'Player 1 (scissors) wins!'
      elsif player2 == 'scissors'
        return 'draw!'
      end
    end

    return 'players must enter a valid move (rock, paper, scissors)'

  end


end
