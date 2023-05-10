
require_relative 'collision_handler'

class HeroFireCollisionHandler < CollisionHandler
  private
  def can_handle?(sprite1, sprite2)
    (sprite1.is_a?(Fire) && sprite2.is_a?(Hero)) || (sprite1.is_a?(Hero) && sprite2.is_a?(Fire))
  end

  def do_handle(sprite1, sprite2)
    hero = sprite1.is_a?(Hero) ? sprite1 : sprite2
    fire = sprite1.is_a?(Fire) ? sprite1 : sprite2

    hero.delta_hp(-10)
    @world.erase_sprite(hero) if hero.is_dead?
    @world.erase_sprite(fire)
    if sprite1 == hero
      @world.move_sprite(sprite1, sprite2.coord)
    end
  end
end
