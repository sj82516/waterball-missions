
require_relative 'collision_handler'
class HeroHeroCollisionHandler < CollisionHandler

  def can_handle?(sprite1, sprite2)
    (sprite1.is_a?(Hero) && sprite2.is_a?(Hero))
  end
end
