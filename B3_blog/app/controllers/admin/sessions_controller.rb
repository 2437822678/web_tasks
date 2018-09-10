class Admin::SessionsController < Admin::BaseController
  def new
  end


  def create
    @manager=Manager.find_by(email: params[:session][:email].downcase)
    if @manager
      session[:manager_id]=@manager.id
      render 'show'
    else
      render 'new'
  end
end

def destroy
  session.delete(:manager_id)
  render 'new'
end

def show
  @manager=Manager.find(:session[:manager_id])
end
end
