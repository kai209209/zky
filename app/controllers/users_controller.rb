class UsersController < ApplicationController
  layout 'user'

  def show    
  end

  def edit    
  end

  def update 
    if current_user.update(update_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end

  private

  def update_params
    params.require(:user).permit(:name, :age, :city, :github, :skill, :experience)
  end

  
end