require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/vet')
require_relative('../models/animal')
also_reload('../models/*')

get '/vets' do
    @vets = Vet.all()
    erb( :"vets/index" )
end

get '/vets/new' do
    @vets = Vet.all()
    erb(:"vets/new")
end

get '/vets/:id' do
    @vet = Vet.find(params['id'].to_i)
    erb(:"vets/show")
end

post '/vets' do
    Vet.new(params).save
    redirect to '/vets'
end

post '/vets/:id/delete' do
    Vet.destroy(params[:id])
    redirect to('/vets')
end