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

post '/animals' do
    Animal.new(params).save
    redirect to '/animals'
end

