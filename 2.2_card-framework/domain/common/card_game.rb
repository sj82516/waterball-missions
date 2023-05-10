class CardGame
  def initialize(players, deck)
    @players = players
    @deck = deck
  end

  def init
    init_deck
    @players.each do |player|
      player.name_himself
    end

    @deck.shuffle
  end

  def draw
    until is_draw_done?
      @players.each do |player|
        card = @deck.draw_card
        player.add_card(card)
      end
    end
  end

  def start
    until is_game_over?
      @players.each do |player|
        player_take_turn(player)
      end

      turn_check
    end

    pp "winner is #{show_winner.name}"
  end

  private
  def init_deck
    raise "not implemented"
  end

  def is_draw_done?
    raise "not implemented"
  end

  def is_game_over?
    raise "not implemented"
  end

  def player_take_turn(player)
    raise NotImplementedError
  end

  def turn_check
    raise "not implemented"
  end

  def show_winner
    raise "not implemented"
  end
end
