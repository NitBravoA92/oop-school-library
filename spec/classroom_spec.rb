require_relative '../classes/classroom'
require_relative '../classes/student'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Mathematics')
  end
  describe '#new' do
    it 'should create an instance of the Classroom class' do
      expect(@classroom).to be_instance_of(Classroom)
    end
  end

  context 'enter_student method' do
    it 'should add a new object of the Student class to the students array' do
      student = Student.new(100, @classroom, 19, 'Peter', parent_permission: true)
      @classroom.enter_student(student)
      expect(@classroom.students).to include(student) # include the new student object in the students array
      expect(@classroom.students.size).to eq(1) # 1 student in the array
    end
  end
end
