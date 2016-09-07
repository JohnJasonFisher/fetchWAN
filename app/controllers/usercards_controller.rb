class UsercardsController < ApplicationController
  before_action :authenticate_user

  def index
    # legacy alert

    # alert = Alert.new(
    #   user_id: current_user.id,
    #   title: 'busy title',
    #   text: 'junk'
    # )
    # alert.alert_seller
    # alert.save

    @card_users = current_user.card_users
    render "index.html.erb"
  end
  
  def new
    render 'new.html.erb'
  end

  def create
    carduser = CardUser.new(
      multiverse_id: params[:multiverse_id],
      quantity: params[:quantity],
      desired_sell_price: params[:desired_sell_price],
      desired_buy_price: params[:desired_buy_price],
      user_id: params[:user_id]
    )
    if card = Card.find_by(multiverse_id: params[:multiverse_id])
      carduser.card_id = card.id
    else
      card = Card.new(multiverse_id: params[:multiverse_id])
      card.name = card.show_name
      card.set_name = card.show_set_name
      card.image_url = card.show_image
      card.current_price = card.pull_retail_price
      card.save
      carduser.card_id = card.id
    end
    carduser.save
    redirect_to '/usercards'
  end

  def destroy
    @card_user = CardUser.find_by(id: params[:id])
    @card_user.destroy
    redirect_to '/cards/portfolio'
  end
end
