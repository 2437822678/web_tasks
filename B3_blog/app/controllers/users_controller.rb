class UsersController < ApplicationController

  #实现用户的注册功能
  def new
    @user=User.new
  end


  def show
    @user=User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
          session[:user_id]=@user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
