
require 'active_record'
ActiveRecord::Base.establish_connection(    #与数据库建立了连接
:adapter => "mysql",
:host => "localhost",
:database => "WEB",
:User => "root",
:Message => "root",
:password => "qq2437822678",
)
