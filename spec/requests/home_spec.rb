require 'spec_helper'

describe "Home" do

  let(:base_title) { "Margherita" }
  subject { page }

  describe "Home Page" do
    before { visit root_path }
    it { should have_selector('h1', :text => "#{base_title}") }
    it { should have_selector('title', :text => full_title("Home")) }
  end

  describe "Help page" do
    before { visit home_help_path }
    it { should have_selector('h1', :text => 'Help') }
    it { should have_selector('title', :text => full_title("Help")) }
  end

  describe "About page" do
    before { visit home_about_path }
    it { should have_selector('h1', :text => 'About') }
    it { should have_selector('title', :text => full_title("About")) }
  end

end
