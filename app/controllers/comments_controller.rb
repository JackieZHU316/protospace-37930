class CommentsController < ApplicationController
  # def new
  #   @comment = Comment.new
  # end

  def create
    @comment = Comment.new(comment_params)
    # binding.pry
    # @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to "/prototypes/#{params[:prototype_id]}"
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"
      # render "/prototypes/#{params[:prototype_id]}"
    end
  end

  def show
  end

  private
  def comment_params
    # comment_value = params[:comment]
    params.require(:comment).permit(:concept).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
