
class Sprite
  def initialize(coord)
    @coord = coord
  end

  attr_accessor :coord
  def to_s
    "#{self.class} at #{coord}"
  end
end
