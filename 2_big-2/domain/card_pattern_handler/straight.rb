require_relative './base.rb'

# 順子
class StraightCardPatternComparison < CardPatternHandler
  PATTERN = '順子'.freeze

  def is_valid?(cards)
    return false if cards.size != 5

    number_map = cards.group_by(&:rank)
    return false if number_map.size != 2

    number_map.values.map(&:size).sort == [2, 3]
  end
end
