require_relative '../hand'

class InvalidPlay < StandardError
end

PASS = :pass

class Player
  attr_reader :name, :hand

  def initialize(name)
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
    begin
      unless top_play.nil?
        return play if play.is_bigger?(top_play)

        raise InvalidPlay
      end

      if is_first_round
        raise InvalidPlay unless play.is_contain_club_3?
      end
    rescue InvalidPlay => e
      # 如果出牌不合法，則將牌收回
      play.cards.each do |card|
        @hand.add_card(card)
      end

      raise e
    end

    play
  end

  def create_play
    @hand.show_cards
    card_idx = gets.chomp.split(' ').map(&:to_i)
    return PASS if card_idx == [-1]

    @hand.create_play(card_idx)
  end
end
