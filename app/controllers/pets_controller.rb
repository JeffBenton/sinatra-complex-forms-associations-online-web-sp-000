class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    binding.pry
    if !params[:owner_id].empty?
      @pet = Pet.create(name: params[:pet_name], owner_id: params[:owner_id])
    else
      @pet = Pet.create(name: params[:pet_name])
      @owner = Owner.create(name: params[:owner_name])
      @pet.owner = @owner
    end
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do 

    redirect to "pets/#{@pet.id}"
  end
end