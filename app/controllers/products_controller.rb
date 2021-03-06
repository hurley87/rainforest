class ProductsController < ApplicationController
  before_filter :ensure_logged_in, :only => [:show]

  def index
  	@products = if params[:search]
      Product.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else
      Product.all
    end

    if request.xhr?
      render @products
    end
  end

  def show
  	@product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)

  	if @product.save
  		redirect_to root_path
  	else
  		render :new
  	end
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])
  	if @product.update_attributes(product_params)
  		redirect_to product_path(@product.id)
  	else
  		render :edit
  	end
  end

  def delete
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to root_path
  end

  private

  def product_params
  	params.require(:product).permit(:name, :description, :price_in_cents)
  end
end
