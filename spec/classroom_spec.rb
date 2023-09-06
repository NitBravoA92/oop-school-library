require_relative "../classes/classroom"
require_relative "../classes/student"

describe Classroom do
  before :each do
    @classroom = Classroom.new("Mathematics")
  end
end
