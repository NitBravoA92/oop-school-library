require_relative '../classes/student'

describe Student do
  before :each do
    @classroom = Classroom.new('Biology')
    @student = Student.new(1, @classroom, 17, 'Louis Schnnel', parent_permission: false)
  end

  describe '#new' do
    it 'should be able to be created' do
      expect(@student).to be_instance_of(Student)
    end

    it 'should save the id of the new student' do
      expect(@student.id).to eq(1)
    end

    it 'should save an object of the Classroom class' do
      expect(@student.classroom).to be_instance_of(Classroom)
      expect(@student.classroom).to eq(@classroom)
    end

    it 'should save the age of the new student' do
      expect(@student.age).to eq(17)
    end

    it 'should save the name of the new student' do
      expect(@student.name).to eq('Louis Schnnel')
    end
  end

  context 'play_hooky method' do
    it 'should return the ¯(ツ)/¯ string' do
      expect(@student.play_hooky).to eq('¯(ツ)/¯')
    end
  end

  context 'to_json method' do
    it 'should convert the a Student object to a hash format' do
      expected_data = {
        id: 1,
        classroom: @classroom.label,
        type: 'student',
        name: 'Louis Schnnel',
        age: 17,
        parent_permission: false,
        rentals: @student.rentals.map(&:id)
      }
      expect(@student.to_json).to eq(expected_data)
    end
  end
end
