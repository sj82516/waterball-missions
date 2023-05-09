# frozen_string_literal: true
# Purpose: Big2 class

require_relative './deck'
require_relative './player/base'
require_relative './card'

class Big2
  def initialize(players)
    @deck = Deck.new
    @players = players
  end

  def init(deck_cards)
    deck_cards.each do |card|
      @deck.add_card(card)
    end
  end

  def start
    @players.each(&:name_himself)

    until @deck.cards.empty?
      @players.each do |player|
        player.add_card(@deck.deal)
      end
    end

    round = 1
    @top_player_idx = @players.find_index { |player| player.hand.is_contain_club_3? }
    @top_player = @players[@top_player_idx]
    @current_player_idx = @top_player_idx
    @current_player = @players[@current_player_idx]
    @top_play = nil
    pass_count = 0

    loop do
      puts '新的回合開始了。'

      loop do
        begin
          puts "輪到 #{@current_player.name} 了"
          play = @current_player.play(@top_play, round == 1)

          if play == PASS
            # 如果是新的回合，頂牌玩家不可 pass
            if @top_play.nil? && @current_player_idx == @top_player_idx
              puts '頂牌玩家不可 PASS'
              next
            end
            
            puts "玩家 #{@current_player.name} PASS"
            pass_count += 1
          else
            puts "玩家 #{@current_player.name} 打出了 #{play.to_s}"
            pass_count = 0
            @top_play = play
            @top_player = @current_player
            @top_player_idx = @current_player_idx
          end

          # 輪到下一位玩家
          @current_player_idx = (@current_player_idx + 1) % @players.size
          @current_player = @players[@current_player_idx]
        rescue InvalidPattern, InvalidPlay
          puts '此牌型不合法，請再嘗試一次。'
        end

        if @top_player.hand.cards.empty?
          return puts "遊戲結束，玩家 #{@top_player.name} 獲勝"
        end

        next unless pass_count == 3
        # 準備新的一輪，從 top_player 開始
        @top_play = nil
        @current_player = @top_player
        @current_player_idx = @top_player_idx
        pass_count = 0
        round += 1
        break
      end
    end
  end
end
