require_relative 'sprite'

class Hero < Sprite
  def initialize(coord)
    super(coord)
    @hp = 30
  end

  def delta_hp(delta)
    @hp += delta
  end

  def is_dead?
    @hp <= 0
  end

  attr_accessor :hp

  def to_s
    "Hero with hp #{@hp} at #{coord}"
  end
end
