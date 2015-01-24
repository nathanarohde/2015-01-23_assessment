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
end

post('/stylist') do
  name = params["name"]
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylist/:id') do
  @stylist = Stylist.find(params['id'].to_i())
  erb(:stylist)
end

get('/stylist/:id/edit') do
  @stylist = Stylist.find(params['id'].to_i())
  erb(:stylist_edit)
end

patch('/stylist/:id') do
  name = params['name']
  @stylist = Stylist.find(params['id'].to_i())
  @stylist.update({:name => name})
  erb(:stylist)
end

delete('/stylist/:id') do
  @stylist = Stylist.find(params['id'].to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:index)
end

get('/client/:id') do
  @client = Client.find(params['id'].to_i())
  erb(:client)
end

patch('/client/:id') do
  name = params['client_name']
  @client = Client.find(params['id'].to_i())
  @client.update({:name => name})
  erb(:client)
end

delete('/client/:id') do
  @client = Client.find(params['id'].to_i())
  @client.delete()
  @stylists = Stylist.all()
  erb(:index)
end
