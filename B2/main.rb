require 'rubygems'
require 'sinatra'
require 'active_record'
require 'mysql'
require './models/Message-operating'
require './models/User-operating'
require './service/DatabaseLink'

configure do
  enable :sessions
  set :session_secret, '111'    #启用session,设置session密码
end

get '/signup'do             #注册路由
  erb :signup
end

post '/signup'do        #创建用户
  @error = []
  @user=User.signup(params[:username],params[:password])
  if @user=='你的用户名和密码为空'
    @error<<'请确保你的用户名和密码不为空'
    elsif @user=='该用户名已经存在'
      @error<<'该用户名已经存在，请更改'
    else     redirect to('success')
  end
end

get '/success'do     #注册成功路由
  erb :success
end

get '/login'do      #显示登录路由
  erb :login
end

post '/login'do      #处理登录信息
  @i=1
  while @i < User.last.id  do
    @user=User.login(params[:username],params[:password])
    if @user=='infos are wrong!'
      redirect to('login/error')
      else
      session[:id]=@user
      redirect to("start/#{@user}")
      break
    end
    @i +=1
  end
end

get '/login/error'do    #显示登录错误信息
  erb :login_error
end

get '/start/:id' do      #显示登录成功页面
  @user = User.find_by(id: session[:id])
  erb :start
end

get '/logout'do        #注销用户
  session.clear
  redirect to "/login"
end

get '/show/infos' do      #显示所有信息页面
  @messages = Message.all
  erb :infos
end

get '/show/new' do      #编辑留言路由
  erb :new_info
end

post '/add/info'do      #创建并保存留言路由
  message=Message.add(params[:content],session[:id],params[:created_at])
  redirect to("infos/#{message.id}")
end

get '/infos/:id' do      # 显示成功创建（添加）的留言信息路由
  @message = Message.find_by(id: params[:id])
  erb :show_info
end

get '/delete/info/:id'do    #以id为查询对象并删除相应的留言信息
  Message.delete(params[:id])
  Message.connection.execute("alter table messages AUTO_INCREMENT=1") #删除的留言不自增，确保显示的留言id永远按1234...排列
  redirect to("show/infos")
end

post '/search/info'do    #通过id和user_id来查询相应的留言信息，其中通过user_id查询的对象返回的是一组信息
  @error=[]
  message1=Message.find_by(id: params[:id])
  message2=Message.find_by(user_id: params[:user_id])
  if message1==nil&&message2==nil
    @error<<'对不起，没有你所要查询的留言'
    elsif message1!=nil
    redirect to("show/search/#{message1.id}")
    else
      redirect to("show/searchs/#{message2.user_id}")
  end
end

get '/show/search/:id'do
   @message=Message.find_by(id:params[:id])  #显示通过id查询的信息页面
  erb :show_search
end

get '/show/searchs/:user_id'do                 #显示通过user_id查询的信息页面
  @messages=Message.where("user_id=?",params[:user_id])
  erb:show_searchs
end

get '/return'do             #返回开始页面路由
  redirect to("start/#{session[:id]}")
end


post '/search/resetinfo'do  #修改个人留言，在这里需要指出强调的是，考虑到实用性，此修改功能只能修改个人的留言信息，不能修改其他用户的信息
  @error = []
  message = Message.find_by(id: params[:id],user_id: session[:id])  #找到需要修改的留言信息
  if message==nil
    @error<<'对不起，不存在你查找的页面'   #如果没有找到，则跳转到错误页面
    else
      info=Message.find_by(id: params[:id],user_id: session[:id])  #若找到，则跳转到修改页面
      redirect to("show/search/reset/#{info.id}")
  end
end

get '/show/search/reset/:id'do    #显示修改页面路由
  @message=Message.find_by(id:params[:id])
  erb :new_search_reset
end

post '/show/search/reset'do    #实现修改功能
  Message.reset(params[:id],params[:content])
  redirect to("show/personal")
end

get '/show/personal'do    #显示修改过后的个人页面信息
  @messages=Message.where("user_id=?",session[:id])
  @user=User.find_by(id:session[:id])
  erb :show_personal
end

get '/up'do      #设置个人页面的返回上一级功能
  redirect to("start/#{session[:id]}")
end

get '/reset'do   # 跳转到修改密码的编辑页面
  redirect to("new_password")
end

get '/new_password'do   #显示修改密码的编辑页面
  erb :new_password
end

post '/reset_sure'do     #实现修改密码的功能
  @error = []
  @user=User.reset1(params[:username],params[:password],params[:new_password])
  if @user== 'passwordnull error'   #如果输入的用户名和原密码在数据库中没有找到对应的用户名和密码，则会redirect to("reset_error")
    @error<<'请确保你输入的新密码不为空'
    elsif @user== 'error'
      @error<< '输入的用户名或者原密码错误，请重新输入！'
      else
        redirect to("reset_success")
  end
end

get '/reset_success'do  #x修改密码成功页面
  erb :reset_success
end









































#auxu
