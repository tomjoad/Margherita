class ProductsController < ApplicationController
  include CartHelper
  include ApplicationHelper

  before_filter :has_rights, :except => [:index]
  # , :only => [:new, :edit, :update, :destroy, :create]

  def index
    @parent = parent
    @products = collection
    @line_items = LineItem.all(session[:cart])
    @cart = find_cart
  end

  def new
    @category = Category.find(params[:category_id])
    @product = @category.products.new
  end

  def create
    @category = Category.find(params[:category_id])
    @product = @category.products.new(params[:product])
    if @product.save
      redirect_to category_path(@category)
    else
      render :action => "new"
    end
  end

  def show
    category_and_product
  end

  def edit
    category_and_product
  end

  def update
    category_and_product
    session[:product_params_test] = params[:product]
    if @product.update_attributes(params[:product])
      redirect_to category_product_path(@category)
    else
      render :action => "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url
  end

  protected

  def parent
    return Category.find(params[:category_id]) if params.key?(:category_id)
  end

  def collection
    (parent.try(:products) || Product).scoped
  end

  private

  def category_and_product
    @category = Category.find(params[:category_id])
    @product = Product.find(params[:id])
  end

  # def user_is_admin_or_seller
  #   redirect_to root_url
  #   # current_user.role.seller? || current_user.role.admin?
  # end

end
