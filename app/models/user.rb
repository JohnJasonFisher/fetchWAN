class User < ActiveRecord::Base
  has_secure_password
  has_many :card_users
  has_many :cards, through:  :card_users
end
