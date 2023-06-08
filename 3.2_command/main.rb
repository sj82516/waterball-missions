require_relative 'domain/tank'
require_relative 'domain/telecom'
require_relative 'domain/command/tank_move_forward_command'
require_relative 'domain/command/tank_move_backward_command'
require_relative 'domain/command/telecom_connect_command'
require_relative 'domain/command/telecom_disconnect_command'
require_relative 'domain/command/reset_main_control_keyboard'
require_relative 'domain/main_control'

def main
  tank = Tank.new
  telecom = Telecom.new

  control = MainControl.new

  support_commands = [
    TankMoveForwardCommand.new(tank),
    TankMoveBackwardCommand.new(tank),
    TelecomConnectCommand.new(telecom),
    TelecomDisconnectCommand.new(telecom),
    ResetMainControlKeyboard.new(control)
  ]

  while true
    input = select_input

    case input
      when '2'
        control.undo
      when '3'
        control.redo
      when '1'
        key = select_key
        commands = select_command(key, support_commands)
        control.set(button: key, commands: commands)
        control.show_commands
      else
        control.press(button: input)
    end
  end
end

def select_input
  pp '(1) 快捷鍵設置 (2) Undo (3) Redo (字母) 按下按鍵:'
  # read from command input
  gets.chomp
end

def select_command(key, support_commands)
  pp "要將哪些指令設置成快捷鍵 #{key}（輸入多個數字，以空白隔開）:"
  support_commands.each_with_index do |command, index|
    pp "(#{index}) #{command.name}"
  end
  gets.chomp.split(' ').map(&:to_i).map { |index| support_commands[index] }
end

def select_key
  pp 'Key: '
  gets.chomp
end

main
