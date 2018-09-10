require 'dm-core'
require 'dm-migrations'
require 'sinatra'
require 'sinatra/reloader' if development?
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")


class Info
  include DataMapper::Resource
  property :id, Serial
  property :message, Text
  property :author, String
  property :create_at, Date

def create_at=date
  super Date.strptime(date, '%m-%d-%Y')
end
end

DataMapper.finalize


get '/infos' do
@infos = Info.all
slim :infos
end

get '/infos/new' do
@info = Info.new
slim :new_info
end

get '/infos/search' do
  slim :search_info
end

get '/infos/:id' do
@info = Info.get(params[:id])
slim :show_info
end

get '/infos/:id/edit' do
@info = Info.get(params[:id])
slim :edit_info
end

post '/infos' do
info = Info.create(params[:info])
redirect to("/infos/#{info.id}")
end

put '/infos/:id' do
info = Info.get(params[:id])
info.update(params[:info])
redirect to("/infos/#{info.id}")
end

delete '/infos/:id' do
Info.get(params[:id]).destroy
redirect to('/infos')
end
