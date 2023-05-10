class Hand
  def initialize
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def get_all_cards
    @cards
  end

  def remove_card(card)
    @cards.delete(card)
  end

  def size
    @cards.size
  end
end
