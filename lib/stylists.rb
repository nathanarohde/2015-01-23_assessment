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
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylists
  end

  define_method(:==) do |another_stylist|
    self.name().==(another_stylist.name()).&self.id().==(another_stylist.id())
  end


end
