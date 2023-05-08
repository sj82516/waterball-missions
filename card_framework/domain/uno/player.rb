require_relative '../common/player'

class UnoPlayer < Player
  def initialize(player_strategy)
    super(player_strategy)
  end

  def is_full_hand?
    @hand.size == 5
  end

  def is_empty_hand?
    @hand.size == 0
  end

  def filter_cards(top_card, cards)
    cards.select { |card| card.is_match?(top_card) }
  end
end
