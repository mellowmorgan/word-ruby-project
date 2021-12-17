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
  @words = Word.all
  erb(:home)
end

post('/home') do
  word = Word.new(:term => params[:word], :id => nil)
  word.save
  redirect back
end

get('/word/:id') do
  @word = Word.find(params[:id].to_i)
  @definitions = Definition.find_by_word(params[:id].to_i)
  erb(:word)
end
post('/word/:id') do
  @word = Word.find(params[:id].to_i)
  @new_definition = Definition.new(:def => params[:definition], :word_id => @word.id, :id => nil)
  @new_definition.save
  @definitions = Definition.find_by_word(params[:id].to_i)
  redirect back
end

get('/word/:id/update') do
  @word = Word.find(params[:id].to_i)
  erb(:word_update)
end

patch('/word/:id/update') do
  @word = Word.find(params[:id].to_i)
  @word.term = params[:new_term]
  @word.save
  @definitions =  Definition.find_by_word(params[:id].to_i)
  erb(:word)
end


patch('/word/:id/update') do
  @word = Word.find(params[:id].to_i)
  @word.term = params[:new_term]
  @word.save
  @definitions =  Definition.find_by_word(params[:id].to_i)
  erb(:word)
end

get('/word/:word_id/definition/:def_id/update') do
  @word = Word.find(params[:word_id].to_i)
  @definition = Definition.find(params[:def_id].to_i)
  erb(:definition_update)
end

patch('/word/:word_id/definition/:def_id/update') do
  @definition = Definition.find(params[:def_id].to_i)
  @definition.def = params[:new_def]
  @definition.save
  @word = Word.find(params[:word_id].to_i)
  @definitions =  Definition.find_by_word(params[:word_id].to_i)
  erb(:word)
end

delete('/word/:id/definition/:id/update') do
  @word = Word.find(params[:id].to_i)
  @word.delete
  redirect '/home'
end
