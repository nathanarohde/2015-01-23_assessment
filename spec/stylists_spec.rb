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


end
