# -*- coding: utf-8 -*-
require 'spec_helper'

describe "User pages" do
  subject { page }

  describe "Signup page" do
    before { visit signup_path }

    it { should have_selector('h1', text: "Sign up") }
    # it { should have_selector('title', text: full_title("Sign up")) }
  end

  describe "user profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user)}

    it { should have_selector('h1', text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Create my account" }

    describe "with invalid data" do
      it "should not create user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid data" do
      before do
        # fill_in "Name", with: "Example"
        fill_in "Email", with: "Example@gmail.com"
        fill_in "Password", with: "secret"
        fill_in "Password confirmation", with: "secret"
      end

      it "should create user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do

      end
    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit edit_user_path(user) }

    describe "page" do
      it { should have_selector('h1', text: "Update your profile") }
      it { should have_selector('title', text: "Edit user") }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }

      it { should have_content('error') }
    end
  end

end
