
class Coord
  def initialize(x)
    @x = x
  end

  attr_accessor :x

  def hash
    @x.hash
  end

  def eql?(other)
    @x == other.x
  end

  def to_s
    @x.to_s
  end
end
