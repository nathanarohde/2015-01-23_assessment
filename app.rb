require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/stylists')
require('./lib/clients')
require('pg')

DB = PG.connect({ :dbname => "hair_salon"})

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

post('/clients') do
  name = params['client_name']
  stylist_id = params['stylist_id'].to_i()
  client = Client.new({:name => name, :stylist_id => stylist_id, :id => nil})
  client.save()
  @stylist = Stylist.find(stylist_id)
  erb(:stylist)

post('/stylists') do
  name = params["name"]
  stylist = Stylist.new({:name => name, id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params['id'].to_i())
  erb(:stylist)
end
