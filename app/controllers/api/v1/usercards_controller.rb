class Api::V1::UsercardsController < ApplicationController
  def index
    @usercards = CardUser.all
    render 'index.json.jbuilder'
  end
end
