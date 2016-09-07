class Card < ActiveRecord::Base
  has_many :card_users
  has_many :users, through: :card_users
  has_many :prices

  # def api_hash
  #   @api_hash ||
  # end

  def data
    @data ||= Unirest.get("https://api.magicthegathering.io/v1/cards/#{multiverse_id}").body
    @data
  end

  def show_name
    # name = Unirest.get("https://api.magicthegathering.io/v1/cards/#{multiverse_id}").body["card"]["name"]
    name = data["card"]["name"]
  end

  def show_set_name
    name = Unirest.get("https://api.magicthegathering.io/v1/cards/#{multiverse_id}").body["card"]["setName"]
    name = data["card"]["setName"]
  end

  def pull_retail_price
    price = Unirest.get("http://magictcgprices.appspot.com/api/cfb/price.json?cardname=#{name}&setname=#{set_name}").body[0]
    if price == ""
      return "Price not available"
    else
      return price[1..-1].to_f
    end
  end

  def pull_market_price
    price = Unirest.get("http://api.mtgowikiprice.com/api/card/price?sets=#{set_name}&cardNames=#{name}&api_key=API_KEY").body
    price = price.split(';')[2][1..-1].to_f
  end

  def self.record_retail_price
    cards = self.all
    cards.each do |card|
      if card.pull_retail_price != card.current_price
        card.current_price = card.pull_retail_price
        card.save
      end
    end
  end

  def self.recond_market_price
    cards = self.all
    cards.each do |card|
      if card.pull_market_price != card.current_price
        card.current_price = card.pull_market_price
        card.save
      end
    end
  end

  def show_image
    image = data["card"]["imageUrl"]
  end
end
