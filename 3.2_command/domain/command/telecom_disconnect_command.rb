require_relative 'command'

class TelecomDisconnectCommand < Command
  def name
    'TelecomDisconnect'
  end

  def initialize(telecom)
    @telecom = telecom
  end

  def execute
    @telecom.disconnect
  end

  def undo
    @telecom.connect
  end
end
