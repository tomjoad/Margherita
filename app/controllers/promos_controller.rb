class PromosController < ApplicationController
  before_filter :has_rights

  include ApplicationHelper

  def index
    @promos = Promo.all
  end

  def new
    @promo = Promo.new
  end

  def show
    @promo = Promo.find(params[:id])
    @variants = Variant.with_promo
  end

  def create
    @promo = Promo.new(params[:promo])
    if @promo.save
      redirect_to @promo
    else
      render :action => "new"
    end
  end

  def destroy
    @promo = Promo.find(params[:id])
    @promo.destroy
    redirect_to promos_path
  end
end
