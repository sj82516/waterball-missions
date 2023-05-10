COLOR = {
  red: 0,
  yellow: 1,
  green: 2,
  blue: 3
}

NUMBER = {
  0 => 0,
  1 => 1,
  2 => 2,
  3 => 3,
  4 => 4,
  5 => 5,
  6 => 6,
  7 => 7,
  8 => 8,
  9 => 9
}

class UnoCard
  def initialize(color, number)
    @color = color
    @number = number
  end

  attr_reader :color, :number

  def is_match?(card)
    @color == card.color || @number == card.number
  end

  def to_s
    "#{@number} of #{@color}"
  end
end
