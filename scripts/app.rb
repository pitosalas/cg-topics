require 'sinatra'

# This web server accepts exactly three urls:
# example.com/ -> form where the user can add a record
# example.com/submit (POST) -> where the form contents is accepted a
#                              new record is creatred
# example.com/models        -> where the list of models is displayed


get '/' do
  erb :index
end

post '/submit' do
  @model = Model.new(params[:model])
  if @model.save
    redirect '/models'
  else
    "Sorry, there was an error!"
  end
end

get '/models' do
  @models = Model.all
  erb :models
end

