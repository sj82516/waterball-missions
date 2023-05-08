require_relative 'hand'

class Player
  def initialize(player_strategy)
    @name = ""
    @player_strategy = player_strategy
    @hand = Hand.new
  end

  attr_accessor :name

  def name_himself
    @name = @player_strategy.name_himself
  end

  def add_card(card)
    @hand.add_card(card)
  end

  def show_card(top_card = nil)
    cards = @hand.get_all_cards
    cards = filter_cards(top_card, cards)
    return nil if cards.empty?

    card = @player_strategy.show_card(cards)
    @hand.remove_card(card)
    card
  end

  private
  def filter_cards(top_card, cards)
    cards
  end
end
