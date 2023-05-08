
class HumanPlayerStrategy
  def initialize
  end

  def name_himself
    puts "Please enter your name:"
    gets.chomp
  end

  def show_card(cards)
    puts "Your cards:"
    cards.each_with_index do |card, idx|
      puts "#{idx}: #{card}"
    end
    puts "Please choose one card by index:"
    card_idx = gets.chomp
    cards[card_idx.to_i]
  end
end
