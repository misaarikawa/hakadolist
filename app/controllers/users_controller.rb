class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    feed_contents = current_user.feed_contents.includes(:content).page(params[:page]).per(10)
    @feed_contents = feed_contents.map(&:content)
  end

  def edit
    
  end

  def update
    current_user.update(update_params)
  end

  def user_index
    
  end

  private
  def update_params
    params.require(:user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :email, :unit, :job, :charge, :avatar)
  end
end
