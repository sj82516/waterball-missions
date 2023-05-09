require_relative './base.rb'

# 葫蘆
class FullHouseCardPatternComparison < CardPatternHandler
  PATTERN = '葫蘆'.freeze

  def is_valid?(cards)
    return false if cards.size != 5

    # 葫蘆只會有兩種 Rank
    number_map = cards.group_by(&:rank)
    return false if number_map.size != 2

    # 葫蘆數量配置為 3 + 2
    number_map.values.map(&:size).sort == [2, 3]
  end

  def find_biggest_card(cards)
    # 依據 number group by，找到最長的 (也就是3張) 其中的最大值
    cards.group_by(&:rank).values.max_by(&:size).max
  end
end
