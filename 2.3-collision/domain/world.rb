
require_relative 'coord'
require_relative 'sprite/hero'
require_relative 'sprite/fire'
require_relative 'sprite/water'
require_relative 'sprite/sprite'

class World
  def initialize
    @sprites = []
    @sprite_map = {}
  end

  attr_accessor :sprites, :collision_handler_chain, :sprite_map

  def set_collision_handler_chain(collision_handler_chain)
    @collision_handler_chain = collision_handler_chain
  end

  def init
    random_gen_sprites
  end

  def move(coord1, coord2)
    sprite1 = @sprite_map[Coord.new(coord1)]
    sprite2 = @sprite_map[Coord.new(coord2)]
    if sprite1 && sprite2
      @collision_handler_chain.handle(sprite1, sprite2)
    end
  end

  def move_sprite(sprite, to_coord)
    @sprite_map.delete(sprite.coord)
    @sprite_map[to_coord] = sprite
    sprite.coord = to_coord
  end

  def erase_sprite(sprite)
    @sprites.delete(sprite)
    @sprite_map.delete(sprite.coord)
  end

  def log
    pp "world log"
    @sprites.each do |sprite|
      puts "#{sprite}"
    end
    pp "========="
  end

  private
  def random_gen_sprites
    sprite_type = [Hero, Water, Fire]

    # gen 10 random coords without duplicates
    random_coords = (0..29).to_a.sample(10)
    10.times.map do |i|
      coord = Coord.new(random_coords[i])
      sprite = sprite_type.sample.new(coord)
      @sprite_map[coord] = sprite
      @sprites << sprite
    end
  end
end
