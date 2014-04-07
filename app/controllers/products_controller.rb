class ProductsController < ApplicationController

  before_action :authenticate_user!

  def new
    @product = Product.new
    @product.company = Company.new
  end

  def create
    @company = Company.find_or_create_by(product_params[:company_attributes])
    @product = Product.new(product_params)
    @product.company = @company
    @product.user = current_user
    @product.image = ImageUploader.new(params[:image])

    if @product.save # && @product.image.store!
      redirect_to root_path, notice: "You just created a new product"
    else
      render :new
    end
  end

  private

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
