
class InvalidPattern < StandardError
end

class Play
  # @param [Array<Card>] cards
  def initialize(cards, pattern_handler_chain)
    @cards = cards
    @pattern_hlr = pattern_handler_chain.find_pattern(cards)
    raise InvalidPattern unless @pattern_hlr
  end

  attr_reader :cards

  def is_bigger?(other_play)
    @pattern_hlr.is_bigger?(self, other_play)
  end

  def to_s
    "#{@pattern_hlr.pattern} #{@cards.map(&:to_s)}"
  end
end
