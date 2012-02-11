require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  # Home page tests
  describe "Home page" do

    it "should have the h1 'Wine Courses'" do
      visit root_path
      page.should have_selector('h1', :text => 'Wine Courses')
    end

    it "should have the title 'Home'" do
      visit root_path
      page.should have_selector('title',
        :text => "#{base_title} | Home")
    end
  end

  # Help page tests
  describe "Help page" do

    it "should have the h1 'Help'" do
      visit help_path
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit help_path
      page.should have_selector('title',
        :text => "#{base_title} | Help")
    end
  end

  # About us page tests
  describe "About page" do

    it "should have the h1 'About'" do
      visit about_path
      page.should have_selector('h1', :text => 'About Us')
    end

    it "should have the title 'About Us'" do
      visit about_path
      page.should have_selector('title',
        :text => "#{base_title} | About Us")
    end
  end

  # Contact us page tests
  describe "Contact page" do

    it "should have the h1 'Contact Us'" do
      visit contact_path
      page.should have_selector('h1', :text => 'Contact Us')
    end

    it "should have the title 'Contact Us'" do
      visit contact_path
      page.should have_selector(
        'title',
        :text => "#{base_title} | Contact Us")
    end
  end
end
