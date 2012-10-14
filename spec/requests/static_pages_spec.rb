require 'spec_helper'

describe "Static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
  end


  describe "Help page" do
    before { visit help_path }
    let(:heading)     {"Help"}
    let(:page_title)  {'Help'}

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:heading)     {"About"}
    let(:page_title)  {'About'}

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading)     {"Contact"}
    let(:page_title)  {'Contact'}

    it_should_behave_like "all static pages"
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'h1', text:'About Us'
    click_link "Help"
    page.should have_selector 'h1', text:'Help'
    click_link "Contact"
    page.should have_selector 'h1', text:'Contact'
  end
end