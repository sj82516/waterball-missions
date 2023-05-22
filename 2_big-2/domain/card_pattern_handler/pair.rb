require_relative './base.rb'
require_relative '../card_pattern/pair.rb'

# 配
class PairCardPatternHandler < CardPatternHandler
  # @param [Card] cards
  def is_valid?(cards)
    cards.size == 2 && cards[0].same_rank?(cards[1])
  end

  def pattern
    PairCardPattern
  end
end
