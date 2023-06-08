require_relative 'command'

class TankMoveBackwardCommand < Command
  def name
    'MoveTankBackward'
  end

  # @param [Tank] tank
  def initialize(tank)
    @tank = tank
  end

  def execute
    @tank.move_backward
  end

  def undo
    @tank.move_forward
  end
end
