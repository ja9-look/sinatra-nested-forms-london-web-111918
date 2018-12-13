require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :"pirates/new"
    end
    
    get '/new' do
      erb:"pirates/new"
    end
    
    post "/pirates" do
      @pirate = Pirate.create(params[:pirate])
      params[:pirate][:ships].each {|ship_info| Ship.create(ship_info)}
      @ships = Ship.all
      erb :"pirates/show"
    end

  end
end
