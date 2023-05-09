require_relative './base'

class AiPlayer < Player

  def set_name
    "AI#{rand(1000).to_s}"
  end
end
