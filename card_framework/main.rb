require_relative 'domain/showdown/game'
require_relative 'domain/showdown/card'
require_relative 'domain/showdown/player'
require_relative 'domain/uno/game'
require_relative 'domain/uno/card'
require_relative 'domain/uno/player'
require_relative 'domain/common/deck'
require_relative 'domain/common/player_strategy/ai_player_strategy'
require_relative 'domain/common/player_strategy/human_player_strategy'

def play_showdown
  showdown = ShowdownGame.new([
    ShowdownPlayer.new(HumanPlayerStrategy.new),
    ShowdownPlayer.new(AiPlayerStrategy.new),
    ShowdownPlayer.new(AiPlayerStrategy.new),
    ShowdownPlayer.new(AiPlayerStrategy.new),
  ], Deck.new)
  showdown.init
  showdown.draw
  showdown.start
end

def play_uno
  uno = UnoGame.new([
    UnoPlayer.new(HumanPlayerStrategy.new),
    UnoPlayer.new(AiPlayerStrategy.new),
    UnoPlayer.new(AiPlayerStrategy.new),
    UnoPlayer.new(AiPlayerStrategy.new),
  ], Deck.new)
  uno.init
  uno.draw
  uno.start
end

def main
  # play_showdown
  play_uno
end

main
