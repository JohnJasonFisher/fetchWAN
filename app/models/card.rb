class Card < ActiveRecord::Base
  validates :multiverse_id, presence: true
  validates :multiverse_id, :numericality => {:only_integer => true}

  has_many :card_users
  has_many :users, through: :card_users
  has_many :prices

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

  def pull_market_price
    price = Unirest.get("http://api.mtgowikiprice.com/api/card/price?sets=#{set}&cardNames=#{name}&api_key=#{ENV['API_KEY']}").body
    p "******************"
    p "******************"
    p price
    p "******************"
    p "******************"
    price = price.split(';')[2][0..-1].to_f
    Price.create(
      price: price,
      card_id: id
    )
    price
  end


  def self.record_market_prices
    cards = Card.all
    cards.each do |card|
      card_price = card.pull_market_price
      if card_price != card.current_price
        puts "PRICE CHANGE !!!!! #{card_price}"
        card.current_price = card_price
        card.save
        usercards = CardUser.where(card_id: card.id)
      end
    end
    puts 'finished'
  end

  def growth_rate
    original_card_price = Price.where(card_id: id).order(created_at: :asc).first.price
    n = current_price - original_card_price
    d = original_card_price
    growth_rate = n / d
  end
end