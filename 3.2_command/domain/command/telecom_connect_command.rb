require_relative 'command'

class TelecomConnectCommand < Command
  def name
    'TelecomConnect'
  end

  def initialize(telecom)
    @telecom = telecom
  end

  def execute
    @telecom.connect
  end

  def undo
    @telecom.disconnect
  end
end
