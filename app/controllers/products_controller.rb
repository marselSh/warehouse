class ProductsController < ApplicationController
  unloadable

  before_filter :find_project_by_project_id
  before_filter :find_product, only: [:edit, :update, :destroy, :show]
  before_filter :authorize

  helper :sort
  include SortHelper

  def index
    sort_init 'id'
    sort_update %w(id name price quantity produced_at issue_id)
    @products = Product.filter_and_sort sort_clause, params[:name]
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new params[:product]
    if @product.save
      redirect_to project_products_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @product.update_attributes params[:product]
      redirect_to project_products_path
    else
      render 'new'
    end
  end

  def destroy
    if @product.destroy
      redirect_to project_products_path, notice: t(:notice_destroyed)
    else
      redirect_to project_products_path, alert: t(:alert_not_destroyed)
    end
  end

  private

  def find_product
    @product = Product.find params[:id]
  end
end
