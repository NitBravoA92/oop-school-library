require_relative '../classes/teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new(1, 'Genetics', 57, 'Frank Mendez')
  end

  describe '#new' do
    it 'should be able to be created' do
      expect(@teacher).to be_instance_of(Teacher)
    end

    it 'should save the id of the new teacher' do
      expect(@teacher.id).to eq(1)
    end

    it 'should save the specialization of the new teacher' do
      expect(@teacher.specialization).to eq('Genetics')
    end

    it 'should save the age of the new teacher' do
      expect(@teacher.age).to eq(57)
    end

    it 'should save the name of the new teacher' do
      expect(@teacher.name).to eq('Frank Mendez')
    end
  end

  context 'can_use_services? method' do
    it 'should always return true' do
      expect(@teacher.can_use_services?).to be_truthy
    end
  end

  context 'to_json method' do
    it 'should convert the a Teacher object to a hash format' do
      expected_data = {
        id: 1,
        type: 'teacher',
        name: 'Frank Mendez',
        age: 57,
        parent_permission: true,
        specialization: 'Genetics',
        rentals: @teacher.rentals.map(&:id)
      }
      expect(@teacher.to_json).to eq(expected_data)
    end
  end
end
