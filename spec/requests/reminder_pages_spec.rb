require "rspec"
require "spec_helper"

describe "Reminder pages" do

  subject { page }

  describe "reminder detail page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:task1) { FactoryGirl.create(:reminder, user: user, content: "Some Task", priority: 2) }

    before { visit reminder_path(task1) }

    it { should have_selector('h3', text: user.name) }
    it { should have_selector('h3', "Priority Level") }

    it { should have_content(task1.content) }
    it { should have_content(user.name) }
    it { should have_content(user.reminders.count) }
  end
end