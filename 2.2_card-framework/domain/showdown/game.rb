require_relative '../common/card_game'
require_relative 'card'

class ShowdownGame < CardGame
  def initialize(players, deck)
    super(players, deck)
    @round = 1
  end

  def init_deck
    RANK.keys.each do |rank|
      SUIT.keys.each do |suit|
        card = ShowdownCard.new(suit, rank)
        @deck.add_card(card)
      end
    end
  end

  def is_draw_done?
    @deck.is_empty?
  end

  def is_game_over?
    @round == 13
  end

  SEGMENT = "========"

  def player_take_turn(player)
    @cards << player.show_card
  end

  def turn_check
    max_card ||= @cards.first
    winner ||= @players.first

    @cards.each_with_index do |card, idx|
      if card.is_bigger?(max_card)
        max_card = card
        winner = @players[idx]
      end
    end

    player_show_cards = @cards.map.with_index { |card, i|
      "#{@players[i].name} show #{card.to_s}"
    }.join(", ")
    pp "cards: #{player_show_cards}"
    pp "winner: #{winner.name}"

    winner.gain_point
    @round += 1
    @cards = []
    pp SEGMENT
  end

  def show_winner
    @players.max { |a, b| a.point <=> b.point }
  end
end
