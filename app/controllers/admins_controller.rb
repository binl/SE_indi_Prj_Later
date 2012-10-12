class AdminsController < ApplicationController
  def management
    @all_users = User.all
    @user = User.new
  end
end
