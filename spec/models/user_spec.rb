# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe User do
  before { @user = User.new(name: "Example", email: "example@example.com", password: "secret", password_confirmation: "secret") }
  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:name) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should reposnd_to(:remember_token) }

  it { should be_valid }

  describe "when name isn`t present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email isn`t present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when user name is to long" do
    before { @user.name = "b" * 31 }
    it { should_not be_valid }
  end

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = ["lukasz@ex,pre", "result_lk.go", "somth@gmlr."]
      addresses.each do |address|
        @user.email = address
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = ["good@email.pl", "AlSO_GOO@dEmail.com", "end_this_one@still.good.pl", "a+s@good.not.sure"]
      addresses.each do |address|
        @user.email = address
        @user.should be_valid
      end
    end
  end

  describe "when email is already taken" do
    before do
      user_duplicate = @user.dup
      user_duplicate.email.upcase
      user_duplicate.save
    end

    it { should_not be_valid }
  end

  describe "when password is blank" do
    before { @user.password = @user.password_confirmation = " "}
    it { should_not be_valid }
  end

  describe "when password doesn`t match confirmation" do
    before { @user.password_confirmation = "something_else" }
    it { should_not be_valid}
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "with a password that is to short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "when authentication is correct" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "when password is invalid" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      # "specify" is the same as "it"
      specify { user_for_invalid_password.should be_false}
    end
  end

end
