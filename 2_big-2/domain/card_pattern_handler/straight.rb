require_relative './base.rb'

# 順子
class StraightCardPatternComparison < CardPatternHandler
  PATTERN = '順子'.freeze

  def is_valid?(cards)
    return false if cards.size != 5

    # 依序排序後，檢查是否為連續的數字
    sorted_cards = cards.sort
    sorted_cards.each_cons(2).all? do |card, next_card|
      card.rank + 1 % 13 == next_card.rank
    end
  end
end
