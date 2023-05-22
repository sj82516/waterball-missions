
require_relative 'collision_handler'

class FireFireCollisionHandler < CollisionHandler

  def can_handle?(sprite1, sprite2)
    (sprite1.is_a?(Fire) && sprite2.is_a?(Fire))
  end
end
