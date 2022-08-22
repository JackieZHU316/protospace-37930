class UsersController < ApplicationController
  def show
    # @prototypes = Prototype.all
    # binding.pry
    @user = User.find(params[:id])
    # @prototype = Prototype.find(@user.name)
    # @user = User.find(@prototype.user_id)
    # @user = User.find(@prototype.user.id)
    # association
    # if @user.name == @prototype.user.name

    # if  == @prototype.user_id
    # end
  end

  # def index
  #   @users = User.all
  # end
end
