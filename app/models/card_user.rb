class CardUser < ActiveRecord::Base
  belongs_to :card
  belongs_to :user

  def total_value
    quantity * card.price
  end

  def self.total_user_collection_value(user_id)
    owned_cards = CardUser.where(user_id: user_id)
    value = 0
    owned_cards.each do |owned_card|
      value += owned_card.total_value
    end
    value
  end

  def self.most_expensive_card

  end

  def self.fastest_growing_card
  end

  def self.fastest_dropping_card
  end
end
