class ProductsController < ApplicationController
    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def show
    end
    
    def create
      @category = Category.find(params[:category_id])
      @product = Product.new(product_params)
      @product.category = @category
      @product.save
      redirect_to category_url({id: @category, error: @product.errors.size})
    end

    def destroy
      @product = Product.find_by(params[:id])
      @product.destroy
      redirect_to category_path
    end
    
    private
    
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
