require_relative './base.rb'
require_relative '../card_pattern/full_house.rb'

# 葫蘆
class FullHouseCardPatternHandler < CardPatternHandler
  def is_valid?(cards)
    return false if cards.size != 5

    # 葫蘆只會有兩種 Rank
    number_map = cards.group_by(&:rank)
    return false if number_map.size != 2

    # 葫蘆數量配置為 3 + 2
    number_map.values.map(&:size).sort == [2, 3]
  end

  def pattern
    FullHouseCardPattern
  end
end
