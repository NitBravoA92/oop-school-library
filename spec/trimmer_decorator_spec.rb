require_relative '../classes/trimmer_decorator'
require_relative '../classes/classroom'
require_relative '../classes/student'

describe TrimmerDecorator do
  before :each do
    @classroom = Classroom.new('Biology')
    @student = Student.new(109, @classroom, 23, 'Samuel Brown', parent_permission: false) # student inherits from Person and Person is a Nameable
    @trimmer_decorator = TrimmerDecorator.new(@student)
  end

  describe "#new" do
    it "should create a new TrimmerDecorator object" do
      expect(@trimmer_decorator).to be_instance_of(TrimmerDecorator)
    end
  end
end
