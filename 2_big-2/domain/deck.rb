class Deck
  attr_reader :cards

  def initialize
    @cards = []
  end

  # @param [Card] card
  def add_card(card)
    @cards << card
  end

  def shuffle
    @cards.shuffle!
  end

  # @return [Card]
  def deal
    @cards.pop
  end
end
