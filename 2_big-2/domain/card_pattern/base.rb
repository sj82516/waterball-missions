class CardPattern
  NAME = '未知'.freeze

  def name
    self.class::NAME
  end
  
  def is_same_pattern?(other_play)
    other_play.pattern.class == self.class
  end
  
  # @param [Play] play
  # @param [Play] other_play
  def is_bigger?(play, other_play)
    card = find_biggest_card(play.cards)
    other_card = find_biggest_card(other_play.cards)
    card > other_card
  end

  def find_biggest_card(cards)
    cards.max
  end
end
