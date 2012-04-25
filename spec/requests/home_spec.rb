require 'spec_helper'

describe "Home" do

  let(:base_title) { "Margherita" }

  describe "Home Page" do
    it "should have the h1 'Margherita'" do
      visit '/'
      page.should have_selector('h1', :text => "#{base_title}")
    end
    it "should have the title 'Margherita'" do
      visit '/'
      page.should have_selector('title', :text => "#{base_title} | Home")
    end
  end

  describe "Help page" do
    it "should have h1 'Help'" do
      visit '/home/help'
      page.should have_selector('h1', :text => 'Help')
    end
    it "should have title 'Help'" do
      visit '/home/help'
      page.should have_selector('title', :text => "#{base_title} | Help")
    end
  end

  describe "About page" do
      it "should have content 'About'" do
      visit '/home/about'
      page.should have_selector('h1', :text => 'About')
    end
    it "should have title 'About'" do
      visit '/home/about'
      page.should have_selector('title', :text => "#{base_title} | About")
    end
  end

end
