# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  before do
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  it { should respond_to(:reminders) }


  # Name Validation
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  # Email Validation
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end
  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end
  describe "email should be unique" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it {should_not be_valid}
  end

  describe "reminder associations" do

    before { @user.save }
    let!(:hp_reminder) do
      FactoryGirl.create(:reminder, user: @user, priority: 3)
    end
    let!(:lp_reminder) do
      FactoryGirl.create(:reminder, user: @user, priority: 1)
    end

    it "should have the reminders in the right order" do
      @user.reminders.should == [hp_reminder, lp_reminder]
    end

    it "should destroy all tasks of a deleted user" do
      reminders = @user.reminders
      @user.destroy
      reminders.each do |reminder|
        Reminder.find(reminder.id).should be_nil
      end
    end
  end
end
