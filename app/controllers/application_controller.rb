class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :get_categories

  def get_categories
    @categories = Category.all
  end

  private

  def user_is_admin
    current_user.admin?
  end

  def user_is_seller
    current_user.seller?
  end

  def user_is_customer
    current_user.customer?
  end

end
