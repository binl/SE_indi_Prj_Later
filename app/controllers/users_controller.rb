class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    @reminders = @user.reminders.paginate(page: params[:page])
  end
end
