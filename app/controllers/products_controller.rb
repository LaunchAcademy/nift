class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    binding.pry
    if params[:sort_query]
      @products = Product.page(params[:page]).order(params[:sort_query] => :desc)
    else
      @products = Product.page(params[:page]).order(:average_rating)
    end
  end

  def show
    @product = Product.find(params[:id])
    @vote = Vote.new
  end

  def new
    @product = Product.new
    @product.company = Company.new
  end

  def create
    @company = Company.find_or_create_by(product_params[:company_attributes])
    @product = Product.new(product_params)
    @product.company = @company
    @product.user = current_user

    if @product.save
      redirect_to root_path, notice: "Product submitted!"
    else
      render :new
    end
  end

  def search
    @products = Product.search("%#{query_params}%")
  end

  private

  def query_params
    params.require(:query)
  end

  def sort_query_params
    params.require(:sort_query).permit(:sort)
  end

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :price,
      :url,
      :image,
      company_attributes: [:name, :location, :url]
    )
  end
end
