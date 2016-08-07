class CardsController < ApplicationController
  def index
    @card_users = current_user.card_users

    render "index.html.erb"
  end

  def show
    @card = Card.find_by(id: params[:id])
    render "show.html.erb"
  end
end
