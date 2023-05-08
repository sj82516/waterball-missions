
require_relative 'collision_handler'
class HeroWaterCollisionHandler < CollisionHandler
  private
  def can_handle?(sprite1, sprite2)
    (sprite1.is_a?(Water) && sprite2.is_a?(Hero)) || (sprite1.is_a?(Hero) && sprite2.is_a?(Water))
  end

  def do_handle(sprite1, sprite2)
    hero = sprite1.is_a?(Hero) ? sprite1 : sprite2
    water = sprite1.is_a?(Water) ? sprite1 : sprite2

    hero.delta_hp(10)
    @world.erase_sprite(water)

    if sprite1 == hero
      @world.move_sprite(sprite1, sprite2.coord)
    end
  end
end
