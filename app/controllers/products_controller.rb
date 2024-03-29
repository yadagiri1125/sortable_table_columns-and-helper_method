class ProductsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index


    #method 3
    @products = Product.order( sort_column + " " + sort_direction )
    #method -2
   # @products = Product.order(params[:sort] + " " + params[:direction])
   #method -1
   # @products = Product.order(params[:sort])
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = "Successfully created product."
      redirect_to @product
    else
      render :action => 'new'
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:notice] = "Successfully updated product."
      redirect_to @product
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Successfully destroyed product."
    redirect_to products_url
  end

  private
  
  def sort_column
  Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
    #params[:sort] ||= "name"
 end
  
 def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    # params[:direction] ||= "asc"

  end

end
