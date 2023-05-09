require_relative './base'

class HumanPlayer < Player

  def set_name
    puts '請輸入你的名字'.freeze
    @name = gets.chomp
  end

end
