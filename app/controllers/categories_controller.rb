class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to @category
    else
      render :action => "new"
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url
  end

end
