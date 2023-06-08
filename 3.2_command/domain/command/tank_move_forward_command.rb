require_relative 'command'

class TankMoveForwardCommand < Command
  def name
    'MoveTankForward'
  end

  # @param [Tank] tank
  def initialize(tank)
    @tank = tank
  end

  def execute
    @tank.move_forward
  end

  def undo
    @tank.move_backward
  end
end
