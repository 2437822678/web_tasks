class User <ActiveRecord::Base        #对将要存入数据库的用户名和密码进行验证
  validates :username,uniqueness: true
  validates :username,length: { minimum: 1 }
  validates :password,length: { minimum: 1 }


    def self.login(username,password)
      user = User.find_by(username: username,password: password)
      if user==nil
        return "infos are wrong!"
      else return user.id
      end
    end

    def self.signup(username,password)
      if username.length==0||password.length==0
        return '你的用户名和密码为空'    #显示注册内容为空的错误信息
        else
          p=User.create(:username=> username , :password=> password).valid?
          if p==false
            return '该用户名已经存在'  #显示注册用户名错误信息
          else
            return 'success'
        end
      end
    end

    def self.reset1(username,password,new_password)
      user=User.find_by(username: username,password: password)
        if user!=nil
          user.update(username: username,password: new_password)#修改密码
          p=user.save
          if p==false
            return 'passwordnull error'
          else
            return 'success'
          end
          else
            return 'error'
          end
      end
end










































#
