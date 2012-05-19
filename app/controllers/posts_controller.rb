class PostsController < ApplicationController
  # post /posts/new
  def new
    @post = Post.new(content: params[:content],
                     user_id: session[:current_user_id])
    
    if params[:bimg]
      trans_img_to_path(params[:bimg]) do |path|
        @post.bimg = path
      end
    elsif params[:simg]
      trans_img_to_path(params[:simg]) do |path|
        @post.simg = path
      end
    end
    @post.save

    redirect_to :back
  end
end
