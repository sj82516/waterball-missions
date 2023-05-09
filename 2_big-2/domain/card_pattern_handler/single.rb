require_relative './base.rb'

# 單張卡片
class SingleCardPatternComparison < CardPatternHandler
  PATTERN = '單張'.freeze

  def is_valid?(cards)
    cards.size == 1
  end
end
