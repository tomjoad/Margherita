class ProductsController < ApplicationController
  include CartHelper
  include ApplicationHelper
  before_filter :user_is_admin_or_seller?, only: [:new, :edit, :update, :destroy, :create]

  def index
    @parent = parent
    @products = collection
    @line_items = LineItem.all(session[:cart])
    @cart = find_cart
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      redirect_to products_path
    else
    #  redirect_to new_product_path
      render :action => "new"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to @product
    else
      render :action => "edit"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_url
  end

  # def add_to_cart
  #   @product = Product.find(params[:id])
  #   @cart = find_cart
  #   @cart.add_item(@product.name)
  #   session[:cart] = @cart.items
  #   redirect_to category_products_path(@product.category)
  # end

  protected

  def parent
    return Category.find(params[:category_id]) if params.key?(:category_id)
  end

  def collection
    (parent.try(:products) || Product).scoped
  end

  private

  def has_rights
    user_is_admin_or_seller?
  end
end
