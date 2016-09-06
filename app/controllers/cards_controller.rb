class CardsController < ApplicationController
  def show
    @usercard = CardUser.find_by(user_id: current_user.id, card_id: params[:id].to_i)
    @card = Card.find_by(id: params[:id])
    render "show.html.erb"
  end
end
