class CardsController < ApplicationController
  def show
    @usercard = CardUser.find_by(user_id: current_user.id, card_id: params[:id].to_i)
    @card = Card.find_by(id: params[:id])
    @all_price = Price.where(card_id: @card.id)
    @month_ago_price = Price.where(card_id: @card.id, created_at: (Time.now - 1.month)..(Time.now))
    render "show.html.erb"
  end
end
