class HomeController < ApplicationController
  # get /home/index
  def index
    @hot_products = Product.limit(3).order('love DESC').all
    @new_products = Product.limit(3).order('created_at DESC').all
    @posts = Post.limit(3).order('created_at DESC').all
    render 'index'
  end

  # get /home/:index_type/:id
  def person_index
    redirect_to :login and return unless session[:current_user_id]
    case params[:index_type].to_i
    when 1 then
      @user = User.find(params[:id])
      @posts = Post.where("user_id = #{ params[:id] }").paginate(page: params[:page], per_page: 5)
    when 2 then
      @user = User.find(session[:current_user_id])
      @posts = Post.where(user_id: Relationship.all_contact(session[:current_user_id])).order("created_at DESC").paginate(page: params[:page], per_page: 5)
    end
  end
  
end
