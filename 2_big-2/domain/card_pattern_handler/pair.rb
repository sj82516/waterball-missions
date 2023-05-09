require_relative './base.rb'

# 配
class PairCardPatternComparison < CardPatternHandler
  PATTERN = '配'.freeze

  # @param [Card] cards
  def is_valid?(cards)
    cards.size == 2 && cards[0].same_rank?(cards[1])
  end
end
