class ProductsController < ApplicationController
  # get /prodcuts/new
  def new
    @product = Product.new
  end

  # post /products/create
  def create
    @product = Product.new(params[:product]) 
    if params[:bimg]
      trans_img_to_path(params[:bimg]) do |path|
        @product.bimg = path
      end
    elsif params[:simg]
      trans_img_to_path(params[:simg]) do |path|
        @product.simg = path
      end
    end
    
    if @product.save
      redirect_to '/home/index'
    else
      render action: 'new'
    end
  end 
  
  # get '/product/:id'
  def index
    redirect_to :login and return unless session[:current_user_id]
    @product = Product.find(params[:id])
    @comments = Comment.where("product_id = #{ params[:id] }").last_creted.paginate(:page => params[:page], :per_page => 3)
  end
  
  # get '/love/:id'
  def love
    product = Product.find(params[:id])
    product.addlove
    render json: {love: product.love}
  end

end
