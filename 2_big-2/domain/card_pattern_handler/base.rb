
class CardPatternHandler
  def initialize(next_handler = nil)
    @next_handler = next_handler
  end

  def find_pattern(cards)
    return pattern.new if is_valid?(cards)
    return @next_handler.find_pattern(cards) if @next_handler

    nil
  end

  # @param [Card] cards
  def is_valid?(cards)
    raise NotImplementedError
  end

  def pattern
    raise NotImplementedError
  end
end
