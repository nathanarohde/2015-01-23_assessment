class Client
  attr_reader(:name, :id, :stylist_id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
    @stylist_id = attributes[:stylist_id]
  end

  define_method(:save) do
    client = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = client.first()['id'].to_i
  end

  define_singleton_method(:all) do
    stored_clients = DB.exec('SELECT * FROM clients')
    clients = []
    stored_clients.each() do |client|
      name = client['name']
      stylist_id = client['stylist_id'].to_i()
      id = client['id'].to_i
      clients.push(Client.new({:name => name, :stylist_id => stylist_id, :id => id}))
    end
    clients
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&self.id().==(another_client.id())
  end


end
