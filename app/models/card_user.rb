class CardUser < ActiveRecord::Base
  belongs_to :card
  belongs_to :user
  def total_value
    quantity * card.price
  end
end
