class CommentsController < ApplicationController
  # post /comments/new/:id
  def new 
    redirect_to :back and return unless session[:current_user_id]
    comment = Comment.new body: params[:body], product_id: params[:id], user_id: session[:current_user_id]
    
    # TODO 这里需要增加错误提示消息
    comment.save
    redirect_to :back
  end
end
