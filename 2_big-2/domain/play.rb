
class InvalidPattern < StandardError
end

class Play
  # @param [Array<Card>] cards
  def initialize(cards, pattern_handler_chain)
    @cards = cards
    @pattern = pattern_handler_chain.find_pattern(cards)
    raise InvalidPattern unless @pattern
  end

  attr_reader :cards, :pattern

  def is_bigger?(other_play)
    @pattern.is_bigger?(self, other_play)
  end

  def to_s
    "#{@pattern.name} #{@cards.map(&:to_s).join("")}"
  end

  def is_same_pattern?(other_play)
    @pattern.is_same_pattern?(other_play)
  end

  def is_contain_club_3?
    @cards.any? { |card| card == CLUB_3 }
  end
end
