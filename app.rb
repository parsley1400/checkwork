require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

before do
  if Count.all.size == 0
    Count.create(number: 0, title: 'カウンター')
  end
end

get '/' do
  @number = Count.first.number
  @counts = Count.all
  @title = Count.first.title
  erb :index
end

post '/counter' do
  Count.create(number: 0)
  redirect '/'
end

post '/title' do
  count = Count.first
  count.title = params[:title]
  count.save
  redirect '/'
end

post '/plus' do
  count = Count.first
  count.number = count.number + 1
  count.save
  redirect '/'
end

post '/plus/:id' do
  count = Count.find(params[:id])
  count.number = count.number + 1
  count.save
  redirect '/'
end

post '/minus' do
  count = Count.first
  count.number = count.number - 1
  count.save
  redirect '/'
end

post '/multiply' do
  count = Count.first
  count.number = count.number * 2
  count.save
  redirect '/'
end

post '/divide' do
  count = Count.first
  count.number = count.number / 2
  count.save
  redirect '/'
end

post '/clear' do
  count = Count.first
  count.number = count.number = 0
  count.save
  redirect '/'
end
