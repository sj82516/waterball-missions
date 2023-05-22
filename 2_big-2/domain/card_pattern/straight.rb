require_relative './base.rb'

# 順子
class StraightCardPattern < CardPattern
  NAME = '順子'.freeze

  def is_valid?(cards)
    return false if cards.size != 5

    # 依序排序後，檢查是否為連續的數字
    sorted_cards = cards.sort
    sorted_cards.each_cons(2).all? do |card, next_card|
      next true if (card.rank + 1) == next_card.rank
      next true if card.rank == 12 && next_card.rank == 3 # A2345
      next true if card.rank == 13 && next_card.rank == 4 # A2345
      false
    end
  end
end
