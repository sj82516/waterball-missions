RANK = {
  2 => 1,
  3 => 2,
  4 => 3,
  5 => 4,
  6 => 5,
  7 => 6,
  8 => 7,
  9 => 8,
  10 => 9,
  'J' => 10,
  'Q' => 11,
  'K' => 12,
  'A' => 13
}

SUIT = {
  'Club' => 1,
  'Diamond' => 2,
  'Heart' => 3,
  'Spade' => 4
}

class ShowdownCard
  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  attr_reader :suit, :number

  def is_bigger?(card)
    if RANK[@rank] == RANK[card.number]
      return SUIT[@suit] > SUIT[card.suit]
    end

    RANK[@rank] > RANK[card.number]
  end

  def to_s
    "#{@rank} of #{@suit}"
  end
end
