require('sinatra')
require('sinatra/reloader')
require('./lib/definition')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:home)
end

get('/home') do
  erb(:home)
end

post('/home') do
  word = Word.new(:term => params[:word], :id => nil)
  word.save
  erb(:home)
end