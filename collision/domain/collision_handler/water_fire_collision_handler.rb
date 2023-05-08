require_relative 'collision_handler'

class WaterFireCollisionHandler < CollisionHandler
  private
  def can_handle?(sprite1, sprite2)
    (sprite1.is_a?(Water) && sprite2.is_a?(Fire)) || (sprite1.is_a?(Fire) && sprite2.is_a?(Water))
  end

  def do_handle(sprite1, sprite2)
    @world.erase_sprite(sprite1)
    @world.erase_sprite(sprite2)
  end
end
