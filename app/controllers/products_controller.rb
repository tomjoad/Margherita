class ProductsController < ApplicationController

  before_filter :get_category

  def get_category
    @categories = Category.all
    @category = Category.find(params[:category_id])
  end

  def index
    @parent = parent
    @products = collection
  end

  def new
    # @category = Category.find(params[:category_id])
    @product = Product.new
  end

  def create
    # @category = Category.find(params[:category_id])
    @product = Product.new(params[:product])

    if @product.save
      redirect_to products_path
    else
      render :action => "new"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    # @category = Category.find(params[:category_id])
    @product = Products.find(params[:id])
  end

  def update
    # @category = Category.find(params[:category_id])
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      redirect_to @category
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

end
