class AiPlayerStrategy
  def name_himself
    "AI" + rand(100).to_s
  end

  def show_card(cards)
    cards.sample
  end
end
