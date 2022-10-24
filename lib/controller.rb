
require 'gossip'

class ApplicationController < Sinatra::Base #on a crée une classe qui hérite de la classe Sinatra::Base
    get '/' do #ca dit à Sinatra "si qq va sur l'URL '/', execute le code qui suit" 
        erb :index, locals: {gossips: Gossip.all} #si qq va sur '/' affiche la view index.erb
     
    end

    #run! if app_file == $0 #permet execution du code de la classe sans avoir à ecrire ApplicationController.new.perform en bas du fichier; c'est l'équivalent d'une méthode

      get '/gossips/new/' do 
        erb :new_gossip
      end
    
      post '/gossips/new/' do
        Gossip.new(params["gossip_author"], params["gossip_content"]).save
        redirect '/'
      end
    
      get '/hello/:id' do
        # matches "GET /hello/foo" and "GET /hello/bar"
        # params['name'] is 'foo' or 'bar'
        "Hello #{params['name']}!"
      end
    
      # demande à la page show de définir une variable (gossip) qui sera le résultat de gossip.find, params sert à récupérer de façon temporaire,
      # ce qui a été écrit avant un rechargement, id est le numéro qui sera incrémenté dans l'index et réutilisé pour créer de nouvelles URL.
      get '/gossips/:id/' do
        erb :show, locals: { gossip: Gossip.find(params['id'].to_i), id: params['id'] }
      end
    end