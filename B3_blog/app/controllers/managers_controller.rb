class ManagersController < ApplicationController
  #实现管理员的注册功能
  def new
    @manager=Manager.new
  end


  def show
    @manager=Manager.find(params[:id])
  end

  def create
    @manager = Manager.new(manager_params)

    respond_to do |format|
      if @manager.save
          session[:user_id]=@manager.id
        format.html { redirect_to @manager, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @manager }
      else
        format.html { render :new }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  def manager_params
    params.require(:manager).permit(:name, :email, :password)
  end
end
