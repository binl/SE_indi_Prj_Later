require 'spec_helper'

describe RemindersController do
  let(:user) { FactoryGirl.create(:user) }
  let!(:reminder) do
    FactoryGirl.create(:reminder, user: @user, priority: 3)
  end

  before { sign_in user }

  describe "creating a reminder with Ajax" do

    it "should increment the Relationship count" do
      expect do
        xhr :post, :create, {reminder: {content: 11222}, optionsRadios: "3", selectedUser: "5"}
      end.to change(Reminder, :count).by(1)
    end

    it "should respond with success" do
      xhr :post, :create, {reminder: {content: 11222}, optionsRadios: "3", selectedUser: "5"}
      response.should be_success
    end
  end

  describe "destroying a relationship with Ajax" do

    it "should decrement the Relationship count" do
      expect do
        xhr :delete, :destroy, id: reminder.id
      end.to change(Reminder, :count).by(-1)
    end

    it "should respond with success" do
      xhr :delete, :destroy, id: reminder.id
      response.should be_success
    end
  end
end
