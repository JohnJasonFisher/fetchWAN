class Card < ActiveRecord::Base
  has_many :card_users
  has_many :users, through: :card_users

  def price
    Unirest.get("http://magictcgprices.appspot.com/api/cfb/price.json?cardname=#{name}").body[0]
  end
end
