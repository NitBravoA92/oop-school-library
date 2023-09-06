require_relative '../classes/capitalize_decorator'
require_relative '../classes/teacher'

describe CapitalizeDecorator do
  before :each do
    @teacher = Teacher.new(10, 'Math', 34, 'Paul Franklin') # teacher inherits from Person and Person is a Nameable
    @capitalize_decorator = CapitalizeDecorator.new(@teacher)
  end

  describe "#new" do
    it "should create a new CapitalizeDecorator object" do
      expect(@capitalize_decorator).to be_instance_of(CapitalizeDecorator)
    end
  end
end
