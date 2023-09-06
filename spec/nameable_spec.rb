require_relative "../classes/nameable"

describe Nameable do
  before :each do
    @nameable = Nameable.new
  end

  describe "#new" do
    it "should create a new Nameable object" do
      expect(@nameable).to be_instance_of(Nameable)
    end
  end
end
