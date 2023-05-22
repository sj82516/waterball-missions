require_relative './base.rb'

# 葫蘆
class FullHouseCardPattern < CardPattern
  NAME = '葫蘆'.freeze

  def find_biggest_card(cards)
    # 依據 number group by，找到最長的 (也就是3張) 其中的最大值
    cards.group_by(&:rank).values.max_by(&:size).max
  end
end
