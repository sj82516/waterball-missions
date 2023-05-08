require_relative '../common/card_game'
require_relative 'card'

class UnoGame < CardGame
  def initialize(players, deck)
    super(players, deck)
    @discard_cards = []
  end

  def init_deck
    NUMBER.keys.each do |rank|
      COLOR.keys.each do |suit|
        card = UnoCard.new(suit, rank)
        @deck.add_card(card)
      end
    end
  end

  def is_draw_done?
    @players.all? { |player| player.is_full_hand? }
  end

  def is_game_over?
    @players.any? { |player| player.is_empty_hand? }
  end

  SEGMENT = "========"

  def take_turn
    @top_card ||= @deck.draw_card

    if @deck.is_empty?
      @discard_cards.each do |card|
        @deck.add_card(card)
      end
      @discard_cards = []
      @deck.shuffle
    end

    @players.each do |player|
      pp "current top card: #{@top_card.to_s}"

      card = player.show_card(@top_card)
      if card.nil?
        pp "#{player.name} cannot show card. draw one from deck."
        player.add_card(@deck.draw_card)
        next
      end

      @discard_cards << @top_card
      @top_card = card
    end
  end

  def show_winner
    @players.find { |player| player.is_empty_hand? }
  end
end
