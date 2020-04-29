require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/vet')
require_relative('../models/animal')
also_reload('../models/*')

get '/animals' do
    @animals = Animal.all()
    erb( :"animals/index" )
end

get '/animals/new' do
    @vets = Vet.all
    @animals = Animal.all
    erb(:"animals/new")
end

get '/animals/:id' do
    @animal = Animal.find(params['id'].to_i)
    erb(:"animals/show")
end

get '/animals/:id/edit' do
    @vets = Vet.all
    @animal = Animal.find(params['id'])
    erb(:"animals/edit")
end

post '/animals/:id' do
    animal = Animal.new(params)
    animal.update
    redirect to "/animals"
end

post '/animals' do
    Animal.new(params).save
    redirect to '/animals'
end

post '/animals/:id/delete' do
    Animal.find(params[:id]).delete
    redirect to('/animals')
end

