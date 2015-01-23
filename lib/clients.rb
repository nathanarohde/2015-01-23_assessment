class Client
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
  end

  define_method(:save) do
    client = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
    @id = client.first()['id'].to_i
  end

  define_singleton_method(:all) do
    stored_clients = DB.exec('SELECT * FROM clients')
    clients = []
    stored_clients.each() do |client|
      name = client['name']
      id = client['id'].to_i
      clients.push(Client.new({:name => name, :id => id}))
    end
    clients
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&self.id().==(another_client.id())
  end


end
