require_relative '../common/player'

class ShowdownPlayer < Player
  def initialize(player_strategy)
    super(player_strategy)
    @point = 0
  end

  def gain_point
    @point += 1
  end

  def point
    @point
  end
end
