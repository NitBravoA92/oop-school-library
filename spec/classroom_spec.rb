require_relative "../classes/classroom"
require_relative "../classes/student"

describe Classroom do
  before :each do
    @classroom = Classroom.new("Mathematics")
  end
  describe "#new" do
    it "should create an instance of the Classroom class" do
      expect(@classroom).to be_instance_of(Classroom)
    end
  end
end
