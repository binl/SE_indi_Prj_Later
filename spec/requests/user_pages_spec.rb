require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:task1) { FactoryGirl.create(:reminder, user: user, content: "Some Task") }
    let!(:task2) { FactoryGirl.create(:reminder, user: user, content: "You should do it urself") }

    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }

    describe "reminders" do
      it { should have_content(task1.content) }
      it { should have_content(task2.content) }
      it { should have_content(user.reminders.count) }
    end
  end
end