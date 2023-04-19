class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end 
  def create
    @product = Product.create(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    render :show
  end

end 

