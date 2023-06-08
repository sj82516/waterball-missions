class MainControl
  RESET = :r

  def initialize
    @button2commands = {}
    @undo_stack = []
    @redo_stack = []
  end

  def reset
    @prev_commands = @button2commands.clone
    @button2commands = {}
    @prev_commands
  end

  def restore(commands)
    return if commands.nil?
    @button2commands = commands
  end

  def set(button:, commands:)
    btn = button.to_sym
    return pp '按鈕已設定'.freeze unless @button2commands[btn].nil?

    @button2commands[btn] = commands
  end

  def press(button:)
    btn = button.to_sym
    return pp '按鈕未設定' if @button2commands[btn].nil?

    @undo_stack += @button2commands[btn]
    @button2commands[btn].each(&:execute)
  end

  def undo
    return if @undo_stack.empty?

    command = @undo_stack.pop
    @redo_stack << command
    command.undo
  end

  def redo
    return if @redo_stack.empty?

    @redo_stack.pop.execute
  end

  def show_commands
    @button2commands.each do |button, commands|
      command_names = commands.map(&:name).join(', ')
      pp "#{button}: #{command_names}"
    end
  end
end
