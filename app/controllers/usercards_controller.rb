class UsercardsController < ApplicationController
  before_action :authenticate_user

  def index
    @card_users = current_user.card_users.order(:created_at)
    render "index.html.erb"
  end

  def new
    @usercard = CardUser.new
    render 'new.html.erb'
  end

  def create
    carduser = CardUser.new(
      multiverse_id: params[:multiverse_id],
      quantity: params[:quantity],
      desired_sell_price: params[:desired_sell_price],
      desired_buy_price: params[:desired_buy_price],
      user_id: params[:user_id],
      card_name: params[:card_name]
    )
    if carduser.save
      if Card.find_by(multiverse_id: params[:multiverse_id])
        card = Card.find_by(multiverse_id: params[:multiverse_id])
        carduser.card_id = card.id
      else
        card = Card.new(multiverse_id: params[:multiverse_id])
        card.name = card.show_name
        card.set_name = card.show_set_name
        card.set = card.show_set
        card.image_url = card.show_image
        card.save
        carduser.card_id = card.id
        carduser.save
        card.current_price = card.pull_market_price
        card.save
      end
      carduser.save
      redirect_to '/usercards'
    else
      flash[:success]
      redirect_to '/usercards/add'
    end
  end

  def update
    @usercard = CardUser.find(params[:id])
    @usercard.update(
      quantity: params[:quantity],
      desired_sell_price: params[:desired_sell_price],
      desired_buy_price: params[:desired_buy_price]
    )
    @usercard.save
    redirect_to "/cards/#{@usercard.card_id}"
  end

  def edit
    @usercard = CardUser.find_by(card_id: params[:card_id])
  end

  def destroy
    @card_user = CardUser.find_by(id: params[:id])
    @card_user.destroy
    redirect_to '/usercards'
  end

  def stats
    @alerts = Alert.where(user_id: current_user.id)
    @alerts = @alerts.limit(3)
    render 'stats.html.erb'
  end
end
