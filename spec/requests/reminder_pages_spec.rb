require "rspec"
require "spec_helper"

describe "Reminder pages" do

  subject { page }

  describe "reminder detail page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:task1) { FactoryGirl.create(:reminder, user: user, content: "Some Task", priority: 2) }

    before { visit reminder_path(task1) }

    it { should have_content(task1.content) }
  end

end