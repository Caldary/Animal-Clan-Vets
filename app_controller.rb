require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/animal_controller')
require_relative('controllers/vet_controller')

get '/animal_clan_vets' do
    erb(:index)
end