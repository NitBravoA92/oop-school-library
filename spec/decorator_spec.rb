require_relative "../classes/person"
require_relative "../classes/decorator"

describe Decorator do
  before :each do
    @person = Person.new(5, 17, "John", parent_permission: true) # Person inherits from Nameable
    @decorator = Decorator.new(@person)
  end

  describe "#new" do
    it "should create a new Decorator object" do
      expect(@decorator).to be_instance_of(Decorator)
    end
  end
end
