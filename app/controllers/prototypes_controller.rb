class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to action: :index
    else
      render :new
    end

    # @prototype_success = Prototype.new(prototype_params)
    # if @prototype_success.save
    #   redirect_to root_path
    # else
    #   # redirect_to new_prototype_path
    #   render :create
    #   # render "/prototypes/new"
    # end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if user_signed_in? && current_user.id == prototype.user.id
      prototype.destroy
      redirect_to action: :index
    # else
    #   @prototype = Prototype.find(params[:id])
    end
  end

  def edit
    prototype = Prototype.find(params[:id])
    unless user_signed_in? && current_user.id == prototype.user.id
      redirect_to action: :index
    else
      @prototype = Prototype.find(params[:id])
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to action: :show
    else
      render :edit
    end
  end


  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end


end
