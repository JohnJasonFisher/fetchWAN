class CardUser < ActiveRecord::Base
  belongs_to :card
  belongs_to :user

  def total_value
    quantity * card.price
  end

  def show_name
    @name = Unirest.get("https://api.magicthegathering.io/v1/cards/#{multiverse_id}").body["card"]["name"]
  end

  def show_image(multiverse_id)
    image = Unirest.get("https://api.magicthegathering.io/v1/cards/#{multiverse_id}").body["card"]["imageUrl"]
  end

  def show_price
    price = Unirest.get("http://magictcgprices.appspot.com/api/cfb/price.json?cardname=#{@name}").body[0]
    if price == ""
      return "Price not available"
    else
      return price
    end
  end
end
