
class CollisionHandler
  def initialize(world, next_handler=nil)
    @world = world
    @next_handler = next_handler
  end

  def handle(sprite1, sprite2)
    if can_handle?(sprite1, sprite2)
      pp "handle by #{self.class}"
      return do_handle(sprite1, sprite2)
    end

    if @next_handler
      @next_handler.handle(sprite1, sprite2)
    end
  end

  private
  def can_handle?(sprite1, sprite2)
    raise "NotImplementedError"
  end

  def do_handle(sprite1, sprite2)
    # default do nothing
  end
end
