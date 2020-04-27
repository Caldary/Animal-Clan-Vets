require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('./models/vet')
require_relative('./models/animal')
also_reload('./models/*')

get '/animals' do
    @animals = Animal.all()
    erb(:index)
end
