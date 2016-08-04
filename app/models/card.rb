class Card < ActiveRecord::Base
  has_many :card_users
  has_many :users, through: :card_users
end
