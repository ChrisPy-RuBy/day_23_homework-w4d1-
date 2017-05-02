require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza.rb')


#What do we want to do. We want to be able to update all the 
#need to format the urls in a manner that is consistent with the "RESTful routes ideas"
#RESTful stands for representation state transfer.
# it is how the webapp expects the user to be spoken to.

#The INDEX route --> a READ action crud
#routes should always be plural.

get '/pizzas' do
  @pizzas = Pizza.all()
  erb( :index ) #erb means that you go and find that needs to be displayed
  #this will currently only display whats in the index file. This should be taken from the model.
end


#NEW action part of CREATE
#will have problems here as the method above will be 

get '/pizzas/new' do
  erb(:new)
end

#Now we want to do read
#The method below will read pretty much anything that gets passed to it.


get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end

#CREATE - CREATE
post '/pizzas' do
  @pizza = Pizza.new( params )
  @pizza.save()
  erb(:create)
end

get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params[:id])
  erb(:edit)
end

post '/pizzas/:id/delete' do
  @pizza = Pizza.find(params[:id])
  @pizza.delete()
  redirect '/pizzas'


end


