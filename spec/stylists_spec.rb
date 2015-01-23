require('spec_helper')

describe('.stylist') do
  describe('#name') do
    it('returns the name of a stylist') do
      stylist= Stylist.new({:name => "Sarah", :id => nil})
      stylist.save()
      expect(stylist.name()).to(eq("Sarah"))
    end
  end

  describe('#id') do
    it('returns the id of a stylist') do
      stylist = Stylist.new({:name => "Sarah", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#all') do
    it('starts off with no stylist') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#save") do
    it('allows sylists to be saved to the sylists table') do
      stylist = Stylist.new({:name => "Caroline", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#==") do
    it('is the same stylist if the name is the same') do
      stylist1 = Stylist.new({:name => "Caroline", :id => nil})
      stylist2 = Stylist.new({:name => "Caroline", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe('find') do
    it('finds a stylist using an id number') do
      stylist1 = Stylist.new({:name => "Caroline", :id => nil})
      stylist1.save()
      stylist2 = Stylist.new({:name => "Dude", :id => nil})
      stylist2.save()
      expect(Stylist.find(stylist1.id())).to(eq(stylist1))
    end
  end

  describe('#clients') do
    it('returns an array of clients for a stylist') do
      stylist1 = Stylist.new({:name => "Caroline", :id => nil})
      stylist1.save()
      client1= Client.new({:name => "Sarah", :id => nil, :stylist_id => stylist1.id()})
      client1.save()
      client2= Client.new({:name => "Bob", :id => nil, :stylist_id => stylist1.id()})
      client2.save()
      client3= Client.new({:name => "Jim", :id => nil, :stylist_id => 999})
      client3.save()
      expect(stylist1.clients()).to(eq([client1, client2]))
    end
  end

  describe('#update') do
    it('lets you update stylists in the database') do
      stylist = Stylist.new({:name => "Caroline", :id => nil})
      stylist.save()
      stylist.update({:name => "Caroline Quiggle"})
      expect(stylist.name()).to(eq("Caroline Quiggle"))
    end
  end

  describe('#delete') do
    it('lets you delete a stylist from the database') do
      stylist = Stylist.new({:name => "Caroline", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => "Mary Sue", :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end

    it('deletes a stylists clients from the database') do
      stylist = Stylist.new({:name => "Caroline", :id => nil})
      stylist.save()
      client = Client.new({:name => "Mary Sue", :stylist_id => stylist.id()})
      client.save()
      client2 = Client.new({:name => "Bobby Joe", :stylist_id=> stylist.id()})
      client2.save()
      stylist.delete()
      expect(Client.all()).to(eq([]))
    end

  end

end
