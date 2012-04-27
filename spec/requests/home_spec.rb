require 'spec_helper'

describe "Home" do

  let(:base_title) { "Margherita" }
  subject { page }

  shared_examples_for "all home pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home Page" do
    before { visit root_path }
    let(:heading) { 'Margherita' }
    let(:page_title) { "" }
    it_should_behave_like "all home pages"

    it { should_not have_selector "title", text: "| Home" }
  end

  describe "Help page" do
    before { visit home_help_path }
    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }
    it_should_behave_like "all home pages"
  end

  describe "About page" do
    before { visit home_about_path }
    let(:heading) { 'About' }
    let(:page_title) { 'About' }
    it_should_behave_like "all home pages"
  end

end
