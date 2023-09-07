require_relative '../classes/person'

describe Person do
  before :each do
    @person = Person.new(1, 20, 'James Lenz', parent_permission: true)
  end

  describe '#new' do
    it 'should be able to be created' do
      expect(@person).to be_instance_of(Person)
    end

    it 'should save the id of the new person' do
      expect(@person.id).to eq(1)
    end

    it 'should save the age of the new person' do
      expect(@person.age).to eq(20)
    end

    it 'should save the name of the new person' do
      expect(@person.name).to eq('James Lenz')
    end
  end

  context 'can_use_services? method' do
    it 'should validate if the person can use the services' do
      expect(@person.can_use_services?).to be_truthy
    end
  end

  context 'correct_name method' do
    it 'should return the name of the Person' do
      expect(@person.correct_name).to eq('James Lenz')
    end
  end

  context 'new_rental method' do
    it 'should add a new object of the Rental class to the rentals array' do
      book = Book.new(5, 'Harry Potter and the Prisoner of Azkaban', 'J.K. Rowling')
      rental = Rental.new(73, book, @person, '2023-06-25')
      @person.new_rental(rental)
      expect(@person.rentals).to include(rental) # include the new rental object in the rentals array
    end
  end
end
