require 'spec_helper'

describe Reminder do
  let(:user) { FactoryGirl.create(:user) }
  before { @reminder = user.reminders.build(content: "Lorem ipsum") }

  subject { @reminder }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:priority) }
  its(:user) {should == user}

  describe "when user_id is not present" do
    before { @reminder.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @reminder.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @reminder.content = "a" * 141 }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Reminder.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
