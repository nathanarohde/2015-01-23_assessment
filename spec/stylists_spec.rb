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

  # describe("#save") do
  #   it('allows')

end
