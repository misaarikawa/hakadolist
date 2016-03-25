class CommentsController < ApplicationController

  def new
    @going = Going.find(params[:going_id])
    @comment = Comment.new
    @comment.going_id = @going.id
    @comments = @going.comments
  end

  def create
    @comment = Comment.create(create_params)
    redirect_to :back
  end

  def edit
    @comment = Comment.find(params[:id])
    @going = @comment.going
  end

  def update
    @comment = Comment.find(params[:id])
    @going = @comment.going
    @comment.update(update_params)
    redirect_to :root and return
  end

  private
  def create_params
    params.require(:comment).permit(:text, :going_id).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:comment).permit(:text)
  end

end
