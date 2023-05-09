require_relative '../hand'

class InvalidPlay < StandardError
end

PASS = :pass

class Player
  attr_reader :name, :hand

  def initialize(name = nil)
    @name = name
    @hand = Hand.new
  end

  def name_himself
    set_name if @name.nil?
  end

  def add_card(card)
    @hand.add_card(card)
  end

  def play(top_play, is_first_round = false)
    play = create_play

    # PASS
    return PASS if play == PASS

    # 有 top_play 代表目前有人出牌，則必須符合出牌規則
    # 且必須大於 top_play
    if top_play
      raise InvalidPlay unless play.is_same_pattern?(top_play)
      raise InvalidPlay unless play.is_bigger?(top_play)
    else
      if is_first_round
        raise InvalidPlay unless play.is_contain_club_3?
      end
    end

    @hand.remove_cards(play.cards)
    play
  end

  def create_play
    @hand.show_cards
    card_idx = gets.chomp.split(' ').map(&:to_i)
    return PASS if card_idx == [-1]

    @hand.create_play(card_idx)
  end
end
