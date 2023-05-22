require_relative 'collision_handler'

class WaterWaterCollisionHandler < CollisionHandler
  private
  def can_handle?(sprite1, sprite2)
    sprite1.is_a?(Water) && sprite2.is_a?(Water)
  end
end
