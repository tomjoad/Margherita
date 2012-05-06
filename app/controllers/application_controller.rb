class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :get_categories

  def get_categories
    @categories = Category.all.sort_by {|c| c.name}
  end

end
