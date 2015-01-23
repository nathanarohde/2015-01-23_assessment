class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
  end

  define_method(:save) do
    stylist = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = stylist.first()['id'].to_i
  end

  define_singleton_method(:all) do
    stored_stylists = DB.exec('SELECT * FROM stylists')
    stylists = []
    stored_stylists.each() do |stylist|
      name = stylist['name']
      id = stylist['id'].to_i
      stylist_id = stylist['stylist_id'].to_i
      stylists.push(Stylist.new({:name => name, :stylist_id => stylist_id, :id => id}))
    end
    stylists
  end

  define_method(:==) do |another_stylist|
    self.name().==(another_stylist.name()).&self.id().==(another_stylist.id())
  end

  define_singleton_method(:find) do |id|
    Stylist.all().each() do |stylist|
      if stylist.id().== (id)
        @found_stylist=stylist
      end
    end
    @found_stylist
  end

  define_method(:clients) do
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id= #{self.id()};")
    clients.each() do |client|
      name = client['name']
      stylist_id = client['stylist_id'].to_i()
      id = client['id'].to_i()
      stylist_clients.push(Client.new({:name => name, :stylist_id => stylist_id, :id => id}))
    end
    stylist_clients
  end

  define_method(:update) do |attributes|
    @name = attributes[:name]
    @id = self.id()
    DB.exec("UPDATE stylists SET name ='#{@name}' WHERE id = #{@id};")
  end

end
