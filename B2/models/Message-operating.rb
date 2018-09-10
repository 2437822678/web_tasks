
class Message <ActiveRecord::Base  #创建Message模型


  def self.add(content,user_id,create)
    create(content: content,user_id: user_id,created_at: create)
  end

  def delete(id)
    info=Message.find_by(id: id)
    info.destroy
  end


   def self.reset(id,content)  
     message=Message.find_by(id: id)
     message.update(content: content)
     message.save
   end
end
