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

  def pull_retail_price
    price = Unirest.get("http://magictcgprices.appspot.com/api/cfb/price.json?cardname=#{name}&setname=#{set_name}").body[0]
    if price == ""
      return "Price not available"
    else
      return price[1..-1].to_f
    end
  end

  # runner "Card.record_prices"

  def self.record_retail_price
    cards = self.all
    cards.each do |card|
      if pull_retail_price != card.current_price
        card.current_price = pull_retail_price
        card.save
      end
    end
  end

  def show_image
    image = Unirest.get("https://api.magicthegathering.io/v1/cards/#{multiverse_id}").body["card"]["imageUrl"]
  end
end
