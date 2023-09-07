require_relative '../classes/rental'

describe Rental do
  before :each do
    @book = Book.new(2, 'The Hobbit', 'J. R. R. Tolkien')
    @teacher = Teacher.new(3, 'Biology', 44, 'John Doe')
    @rental = Rental.new(1, @book, @teacher, '2023-08-31')
  end

  describe '#new' do
    it 'should create a new rental object' do
      expect(@rental).to be_instance_of(Rental)
    end

    it 'should save the id of the new rental' do
      expect(@rental.id).to eq(1)
    end

    it 'should save the date of the new rental' do
      expect(@rental.date).to eq('2023-08-31')
    end

    it 'should save an object of the Book class' do
      expect(@rental.book).to be_instance_of(Book)
      expect(@rental.book).to eq(@book)
    end

    it 'should save an object of the Teacher class' do
      expect(@rental.person).to be_instance_of(Teacher)
      expect(@rental.person).to eq(@teacher)
    end
  end
end
