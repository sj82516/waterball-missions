require_relative './card_pattern_handler/single'
require_relative './card_pattern_handler/pair'
require_relative './card_pattern_handler/full_house'
require_relative './card_pattern_handler/straight'
require_relative './play'

class Hand
  def initialize
    @cards = []
  end

  def add_card(card)
    @cards << card
  end

  def create_play(card_idx)
    cards = card_idx.map { |idx| @cards[idx] }
    handler_chain = SingleCardPatternComparison.new(
      FullHouseCardPatternComparison.new(
        StraightCardPatternComparison.new(
          PairCardPatternComparison.new)
      )
    )
    @cards -= cards

    Play.new(cards, handler_chain)
  end

  def show_cards
    idx_lines = ""
    card_lines = ""
    @cards.sort!
    @cards.each_with_index do |card, idx|
      card_str = card.to_s
      idx_str = "#{idx}"
      max = [idx_str.size, card_str.size].max
      idx_lines += idx_str + ' ' * (max - idx_str.size) + ' '
      card_lines += card_str + ' ' * (max - card_str.size) + ' '
    end
    puts idx_lines
    puts card_lines
  end

  attr_reader :cards
end
