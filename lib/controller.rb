#require 'pry'
require 'sinatra/base'
require 'gossip'

class ApplicationController < Sinatra::Base
#Page d'acceuil avec la liste des gossips  
  get '/' do
    erb :index, locals: {gossip: Gossip.all} 
  end

#page de creation d'un nouveau gossip
  get '/gossips/new/' do
    erb :new_gossip 
  end 

#création et enregistrement d'un nouveau gossip
  post '/gossips/new' do 
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
  redirect '/' #retour sur la page d'accueil après la sauvegarde
  end 

#affichage du gossip par son ID
	get '/gossips/:id' do 
    id = params['id']
		Gossip.find(id)
	erb :show, locals: {gossip: Gossip.all}
  end

# permet d'éditer avec le formualaire edit.erb
  post '/gossips/:id/edit' do
  Gossip.new(params["gossip_author"],params["gossip_content"]).edit(id.to_i)
  redirect '/'
  end

end

#binding.pry

=begin
  post '/gossips/new/' do
     Gossip.new("Mon super auteur", "Ma super description").save
  end

  post '/gossips/new/' do
    puts "Salut, je suis dans le serveur"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
    puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
    puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
  end
=end