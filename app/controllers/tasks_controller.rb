class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    Task.create(create_params)
    redirect_to :action => "index"
  end

  def index
    @task = Task.new
    @tasks = Task.all.page(params[:page]).per(10).order("created_at DESC")
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(update_params)
    redirect_to :root and return
  end

  def show
    @task = Task.find(params[:id])
    @going = Going.new
    @going.task_id = @task.id
    @goings = @task.goings
    unless 
      TaskCheck.find_by(user_id: current_user.id, task_id: params[:id])
      TaskCheck.create(user_id: current_user.id, task_id: params[:id], is_read: 1)
    end
  end

  private
  def create_params
    params.require(:task).permit(:title, :detail).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:task).permit(:title, :detail)
  end

end
