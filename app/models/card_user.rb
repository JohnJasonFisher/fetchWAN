class CardUser < ActiveRecord::Base
  belongs_to :card
  belongs_to :user

  def total_value
    quantity * card.current_price
  end

  def self.total_usercard_value(user_id)
    @owned_cards = CardUser.where(user_id: user_id)
    value = 0
    @owned_cards.each do |owned_card|
      value += owned_card.total_value
    end
    value
  end

  def self.fastest_growing_usercard_growth_rate(user_id)
    @owned_cards = CardUser.where(user_id: user_id)
    all_growth_rates = []
    @owned_cards.each do |owned_card|
      all_growth_rates << [owned_card.card.growth_rate, owned_card.card]
    end
    p all_growth_rates
    growth_rate = all_growth_rates.max[0]
    growth_rate = growth_rate * 100
    growth_rate.to_s[0..3]
  end

  def self.fastest_growing_usercard_card_name(user_id)
    @owned_cards = CardUser.where(user_id: user_id)
    all_growth_rates = []
    @owned_cards.each do |owned_card|
      all_growth_rates << [owned_card.card.growth_rate, owned_card.card]
    end
    p all_growth_rates
    growth_card = all_growth_rates.max[1]
    growth_card.name
  end
end
