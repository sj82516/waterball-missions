require_relative '../common/card_game'
require_relative 'card'

class ShowdownGame < CardGame
  def initialize(players, deck)
    super(players, deck)
    @round = 0
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

  def take_turn
    @round += 1
    pp SEGMENT
    pp "Round #{@round}"

    max_card = nil
    winner = nil
    cards = []
    @players.each do |player|
      card = player.show_card
      cards << card
      max_card ||= card
      winner ||= player

      if card.is_bigger?(max_card)
        max_card = card
        winner = player
      end
    end

    player_show_cards = cards.map.with_index { |card, i|
      "#{@players[i].name} show #{card.to_s}"
    }.join(", ")
    pp "cards: #{player_show_cards}"
    pp "winner: #{winner.name}"

    winner.gain_point
  end

  def show_winner
    @players.max { |a, b| a.point <=> b.point }
  end
end
