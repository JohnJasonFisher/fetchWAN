class CardsController < ApplicationController
  def index
    if !current_user
      redirect_to '/login'
    else
      @card_users = current_user.card_users
      render "index.html.erb"
    end
  end

  def show
    @card = Card.find_by(id: params[:id])
    render "show.html.erb"
  end

  def portfolio
    @card_users = current_user.card_users
    render 'portfolio.html.erb'
  end
end
