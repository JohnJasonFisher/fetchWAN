class CardUser < ActiveRecord::Base
  belongs_to :card
  belongs_to :user

  validates :multiverse_id, presence: true
  validates :multiverse_id, :numericality => {:only_integer => true}

  def total_value
    quantity * card.current_price
  end

  def self.total_quantity(user_id)
    @owned_cards = CardUser.where(user_id: user_id)
    total_quantity = 0
    @owned_cards.each do |owned_card|
      total_quantity += owned_card.quantity
    end
    total_quantity
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
    if all_growth_rates.empty?
      return "0"
    end
    growth_rate = all_growth_rates.max[0]
    growth_rate = growth_rate * 100
    growth_rate.to_s[0..2].delete "."
  end

  def self.fastest_growing_usercard_card_name(user_id)
    @owned_cards = CardUser.where(user_id: user_id)
    all_growth_rates = []
    @owned_cards.each do |owned_card|
      all_growth_rates << [owned_card.card.growth_rate, owned_card.card]
    end
    p all_growth_rates
    if all_growth_rates.empty?
      return "You Have No Cards"
    end
    growth_card = all_growth_rates.max[1]
    growth_card.name
  end

  def self.fastest_growing_usercard_card_image_url(user_id)
    @owned_cards = CardUser.where(user_id: user_id)
    all_growth_rates = []
    @owned_cards.each do |owned_card|
      all_growth_rates << [owned_card.card.growth_rate, owned_card.card]
    end
    p all_growth_rates
    if all_growth_rates.empty?
      return "You Have No Cards"
    end
    growth_card = all_growth_rates.max[1]
    growth_card.image_url
  end
end
