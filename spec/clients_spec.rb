require('spec_helper')

describe('.client') do
  describe('#name') do
    it('returns the name of a client') do
      client= Client.new({:name => "Sarah", :id => nil, :stylist_id => 1})
      client.save()
      expect(client.name()).to(eq("Sarah"))
    end
  end

  describe('#id') do
    it('returns the id of a client') do
      client = Client.new({:name => "Sarah", :id => nil, :stylist_id => 1})
      client.save()
      expect(client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#stylist_id') do
    it('returns the id of the clients stylist') do
      client = Client.new({:name => "Sarah", :id => nil, :stylist_id => 1})
      client.save()
      expect(client.stylist_id()).to(eq(1))
    end
  end

  describe('#all') do
    it('starts off with no client') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it('allows clients to be saved to the clients table') do
      client = Client.new({:name => "Caroline", :id => nil, :stylist_id => 1})
      client.save()
      expect(Client.all()).to(eq([client]))
    end
  end

  describe("#==") do
    it('is the same client if the name is the same') do
      client1 = Client.new({:name => "Caroline", :id => nil, :stylist_id => 1})
      client2 = Client.new({:name => "Caroline", :id => nil, :stylist_id => 1})
      expect(client1).to(eq(client2))
    end
  end


end
