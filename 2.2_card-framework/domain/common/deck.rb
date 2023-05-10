
class Deck
  attr_reader :cards

  def initialize
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def shuffle
    @cards.shuffle!
  end

  def draw_card
    @cards.pop
  end

  def is_empty?
    @cards.empty?
  end
end
