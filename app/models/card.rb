class Card < ActiveRecord::Base
  has_many :card_users
  has_many :users, through: :card_users
  has_many :prices

  # def api_hash
  #   @api_hash ||
  # end

  def show_name
    name = Unirest.get("https://api.magicthegathering.io/v1/cards/#{multiverse_id}").body["card"]["name"]
  end

  def show_set_name
    name = Unirest.get("https://api.magicthegathering.io/v1/cards/#{multiverse_id}").body["card"]["setName"]
  end

  def show_price
    price = Unirest.get("http://magictcgprices.appspot.com/api/cfb/price.json?cardname=#{card_name}&setname=#{set_name}").body[0]
    if price == ""
      return "Price not available"
    else
      return price
    end
  end

  def show_image
    image = Unirest.get("https://api.magicthegathering.io/v1/cards/#{multiverse_id}").body["card"]["imageUrl"]
  end

  def ping_current_price
    Price.create({
      card_id: id,
      price: show_price
      })
  end
end
