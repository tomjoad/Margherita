class ProductsController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.find(params[:category_id])
    @product = @category.products.new
  end

  def create
    @category = Category.find(params[:category_id])
    @product = @category.products.new(params[:product])

    if @product.save
      redirect_to @category
    else
      render :action => "new"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])

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

end
