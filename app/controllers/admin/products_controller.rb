class Admin::ProductsController < ApplicationController

  # before_filter :user_should_be_admin - this has to work.

  include AuthHelper

  def index
    @products = Product.all
  end

end
