class UsersController < ApplicationController
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @reminders = @user.reminders.paginate(page: params[:page])
  end

  def create
    #puts params
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        @all_users = User.all
        format.html { redirect_to '/admins/management', notice: 'User was successfully created.' }
        format.json { render json: @reminder, status: :created, location: @reminder }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end
  # PUT /items/1
  # PUT /items/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to '/admins/management', notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    @all_users = User.all

    respond_to do |format|
      format.html { redirect_to '/admins/management' }
      format.json { head :no_content }
      format.js
    end
  end
end
