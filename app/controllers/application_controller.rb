class ApplicationController < Sinatra::Base

  set :default_content_type, "application/json"

  get '/games' do
    Game.all.to_json
  end

  get "/games/:id" do
    Game.find(params[:id]).to_json(include: {reviews: {include: :user}})
  end

end
