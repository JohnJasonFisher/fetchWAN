class Card < ActiveRecord::Base
  has_many :card_users
  has_many :users, through: :card_users
  has_many :prices

  # def api_hash
  #   @api_hash ||
  # end

  def price
    current_price
  end

  def data
    @data ||= Unirest.get("https://api.magicthegathering.io/v1/cards/#{multiverse_id}").body
    @data
  end

  def show_name
    name = data["card"]["name"]
  end

  def show_set_name
    name = data["card"]["setName"]
  end

  def show_set
    name = data["card"]["set"]
  end

  def show_image
    image = data["card"]["imageUrl"]
  end

  # def pull_retail_price
  #   price = Unirest.get("http://magictcgprices.appspot.com/api/cfb/price.json?cardname=#{name}&setname=#{set_name}").body[0]
  #   if price == "" || '0.00'
  #     return 'price not available'
  #   else
  #     return price[0..-1].to_f
  #   end
  # end

  def pull_market_price
    price = Unirest.get("http://api.mtgowikiprice.com/api/card/price?sets=#{set}&cardNames=#{name}&api_key=#{ENV['API_KEY']}").body
    price = price.split(';')[2][0..-1].to_f
    Price.create(
      price: price,
      card_id: id
    )
    price
  end

  # def self.record_retail_price
  #   cards = self.all
  #   cards.each do |card|
  #     if card_price != card.current_price
  #       card.current_price = card_price
  #       card.save
  #     end
  #   end
  # end

  def self.record_market_prices
    cards = self.all
    usercards = CardUser.all
    cards.each do |card|
      card_price = card.pull_market_price
      usercards.each do |usercard|
        card_price = card.pull_market_price
        # if usercard.desired_sell_price < card_price
        #   Alert.alert_seller(usercard.user.phone_number)
        # end
        if card_price != card.current_price
          puts "PRICE CHANGE !!!!! #{card_price}"
          card.current_price = card_price
          card.save
          puts card_price
        end 
      end
    end
    puts 'finished'
  end

  # def self.record_market_price
  #   card = self.first
  #   usercard = CardUser.first
  #   card_price = card.pull_market_price
  #   if usercard.desired_sell_price < card_price
  #     Alert.alert_seller(usercard.user.name, usercard.user.phone_number)
  #   end
  #   if card_price != card.current_price
  #     puts "PRICE CHANGE !!!!! #{card_price}"
  #     card.current_price = card_price
  #     card.save
  #     puts card_price
  #   end 
  # end

  def growth_rate
    # This returns all prices of one card in an array
    # all_price = Price.where(card_id: id)
    # all_market_prices = []
    # all_price.each do |price|
    #   all_market_prices << price.price
    # end
    # all_market_prices
    original_card_price = Price.where(card_id: id).order(created_at: :asc).first.price
    n = current_price - original_card_price
    d = original_card_price
    puts '*' * 30
    puts "current_price: #{current_price}"
    puts "original_card_price: #{original_card_price}"
    puts '*' * 30
    growth_rate = n / d
  end

  def self.growth_rate
    
  end
end