class RemindersController < ApplicationController
  def new
    @reminder = Reminder.new
  end

  def show
    @reminder = Reminder.find(params[:id])
  end

  def create
    puts params
    @reminder = Reminder.new(params[:reminder])
    @reminder.priority = params[:optionsRadios]
    @reminder.user = User.find(params[:selectedUser])

    respond_to do |format|
      if @reminder.save
        @all_reminders = Reminder.all
        format.html { redirect_to reminders_path, notice: 'User was successfully created.' }
        format.json { render json: @reminder, status: :created, location: @reminder }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def index
    @all_reminders = Reminder.all
    @all_users = User.all
    @reminder = Reminder.new
  end

  def edit
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.destroy
    @all_reminders = Reminder.all

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
      format.js
    end
  end
end
