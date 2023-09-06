require_relative '../classes/student'

describe Student do
  before :each do
    @classroom = Classroom.new('Biology')
    @student = Student.new(1, @classroom, 17, 'Louis Schnnel', parent_permission: false)
  end

  describe "#new" do
    it "should be able to be created" do
      expect(@student).to be_instance_of(Student)
    end

    it "should save the id of the new student" do
      expect(@student.id).to eq(1)
    end

    it "should save an object of the Classroom class" do
      expect(@student.classroom).to be_instance_of(Classroom)
      expect(@student.classroom).to eq(@classroom)
    end

    it "should save the age of the new student" do
      expect(@student.age).to eq(17)
    end

    it "should save the name of the new student" do
      expect(@student.name).to eq("Louis Schnnel")
    end
  end
end
