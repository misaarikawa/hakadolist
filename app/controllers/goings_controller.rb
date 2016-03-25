class GoingsController < ApplicationController

  def new
    @task = Task.find(params[:task_id])
    @going = Going.new
    @going.task_id = @task.id
  end

  def create
    @going = Going.create(create_params)
    redirect_to :root and return
  end

  def index
    
  end

  def edit
    @going = Going.find(params[:id])
    @task = @going.task
  end

  def update
    @going = Going.find(params[:id])
    @task = @going.task
    @going.update(update_params)
    redirect_to :root and return
  end

  def show
    @going = Going.find(params[:id])
    @comment = Comment.new
    @comment.going_id = @going.id
    unless 
      GoingCheck.find_by(user_id: current_user.id, going_id: params[:id])
      GoingCheck.create(user_id: current_user.id, going_id: params[:id], is_read: 1)
    end
  end

  private
  def create_params
    params.require(:going).permit(:text, :task_id).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:going).permit(:text)
  end

end
