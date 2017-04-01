class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    @seq.each_with_index do |color, i|
      puts "Enter color #{i + 1} of the sequence (r for red, b for blue, etc.) "
      guess = gets.chomp
      unless guess == color[0]
        @game_over = true
        return
      end
    end
  end

  def add_random_color
    @seq.push(COLORS.sample)
  end

  def round_success_message
    "Success! Round completed. Congratulations!"
  end

  def game_over_message
    "Failure! Game over. Better luck next time!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

Simon.new.play
