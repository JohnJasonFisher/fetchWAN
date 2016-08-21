class Card < ActiveRecord::Base
  has_many :card_users
  has_many :users, through: :card_users

  def price
    price = Unirest.get("http://magictcgprices.appspot.com/api/cfb/price.json?cardname=#{name}").body[0]
    if price == ""
      return "Price not available"
    else
      return price
    end
  end
end
