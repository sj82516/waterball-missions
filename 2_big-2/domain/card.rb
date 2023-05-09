# frozen_string_literal: true
# Card is poker card
class Card
  include Comparable

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  attr_reader :rank, :suit

  def <=>(other)
    return @suit <=> other.suit if @rank == other.rank

    @rank <=> other.rank
  end

  def to_s
    "#{SUIT_SYMBOL[@suit]}[#{RAND_SYMBOL[@rank]}]"
  end

  def same_rank?(other)
    @rank == other.rank
  end
end


RANK = {
  A: 12,
  '2': 13,
  '3': 1,
  '4': 2,
  '5': 3,
  '6': 4,
  '7': 5,
  '8': 6,
  '9': 7,
  '10': 8,
  J: 9,
  Q: 10,
  K: 11
}.freeze

RAND_SYMBOL = {
  12 => 'A',
  13 => '2',
  1 => '3',
  2 => '4',
  3 => '5',
  4 => '6',
  5 => '7',
  6 => '8',
  7 => '9',
  8 => '10',
  9 => 'J',
  10 => 'Q',
  11 => 'K'
}.freeze

SUIT = {
  S: 4,
  H: 3,
  D: 2,
  C: 1
}.freeze

SUIT_SYMBOL = {
  4 => '♠',
  3 => '♥',
  2 => '♦',
  1 => '♣'
}.freeze

CLUB_3 = Card.new(RANK[3.to_s.to_sym], SUIT[:C])
