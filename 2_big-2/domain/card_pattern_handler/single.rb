require_relative './base.rb'
require_relative '../card_pattern/single.rb'

# 單張卡片
class SingleCardPatternHandler < CardPatternHandler
  def is_valid?(cards)
    cards.size == 1
  end

  def pattern
    SingleCardPattern
  end
end
