class UsersController < ApplicationController
  # GET /login
  def login
    redirect_to '/home/index' and return if session[:current_user_id]
    if cookies[:user_id] and (user = User.find(cookies[:user_id].to_i))
      session[:current_user_id], session[:current_user_name] = user.id, user.name
      redirect_to '/home/index'
    end
  end

  # POST /auth
  def auth
    users = User.where("name = '#{ params[:name] }' and pwd = '#{ params[:pwd] }'")
    if users.size == 1
      @user = users[0]
      session[:current_user_id] = @user.id and session[:current_user_name] = @user.name
      cookies[:user_id] = @user.id if params[:remember] == '1'
      cookies.delete(:user_id) unless params[:remember] == '1'
      redirect_to '/home/index'
    elsif
      redirect_to :back
    end
  end

  # get /logout
  def logout
    session[:current_user_id], session[:current_user_name] = nil, nil
    cookies.delete(:user_id)
    redirect_to '/login'
  end

  # get /user/newicon
  def newicon
  end
  
  # post /user/seticon
  def seticon
    user = User.find(session[:current_user_id])
    bicon =  trans_img_to_path(params[:bicon]) do |path|
      user.bicon = path
    end
    user.save
    redirect_to "/home/2/#{ session[:current_user_id] }"
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    if @user.save
      session[:current_user_name], session[:current_user_id] = @user.name, @user.id
      redirect_to '/login'
    else
      render action: "new"
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
