
class CardPatternHandler
  PATTERN = nil

  def initialize(next_handler = nil)
    @next_handler = next_handler
  end

  def find_pattern(cards)
    return self if is_valid?(cards)
    return @next_handler.find_pattern(cards) if @next_handler

    nil
  end

  def pattern
    self.class::PATTERN
  end

  # @param [Card] cards
  def is_valid?(cards)
    raise NotImplementedError
  end

  def is_bigger?(play, other_play)
    card = find_biggest_card(play.cards)
    other_card = find_biggest_card(other_play.cards)
    card > other_card
  end

  def find_biggest_card(cards)
    cards.max
  end
end
