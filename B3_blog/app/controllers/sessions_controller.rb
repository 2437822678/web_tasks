class SessionsController < ApplicationController

  #实现登录界面引入session机制
  def new
  end

  def create
    @user=User.find_by(email: params[:session][:email].downcase)
    if @user
      session[:user_id]=@user.id
      render 'show'
    else
      render 'new'
  end
end

  def destroy
    session.delete(:user_id)
    render 'new'
  end

  def show
    @user=User.find(:session[:user_id])
  end

end
