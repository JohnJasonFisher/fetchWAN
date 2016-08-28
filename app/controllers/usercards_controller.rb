class UsercardsController < ApplicationController
  def index
    if !current_user
      redirect_to '/login'
    else
      @card_users = current_user.card_users
      render "index.html.erb"
    end
  end
  
  def new
    render 'new.html.erb'
  end

  def create
    carduser = CardUser.new(
    card_id: params[:card_id],
    quantity: params[:quantity],
    desired_sell_price: params[:desired_sell_price],
    desired_buy_price: params[:desired_buy_price],
    user_id: params[:user_id]
    )
    if carduser.save
      redirect_to '/usercards'
    else
      render :new
    end
  end

  def destroy
    @card_user = CardUser.find_by(id: params[:id])
    @card_user.destroy
    redirect_to '/cards/portfolio'
  end
end
