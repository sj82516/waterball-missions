require_relative 'command'

class ResetMainControlKeyboard < Command
  def name
    'ResetMainControlKeyboard'
  end

  def initialize(control)
    @control = control
  end

  def execute
    @prev_commands = @control.reset
  end

  def undo
    @control.restore(@prev_commands)
  end
end
