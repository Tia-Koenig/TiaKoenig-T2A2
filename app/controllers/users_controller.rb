class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @user_cards = @user.cards
  end

end
