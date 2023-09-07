require_relative '../classes/book'
require_relative '../classes/teacher'
require_relative '../classes/rental'

describe Book do
  before :each do
    @book = Book.new(1, 'The Great Gatsby', 'F. Scott Fitzgerald')
  end
  describe '#new' do
    it 'should be able to be created' do
      expect(@book).to be_instance_of(Book)
    end

    it 'should save the id of the new book' do
      expect(@book.id).to eq(1)
    end

    it 'should save the title of the new book' do
      expect(@book.title).to eq('The Great Gatsby')
    end

    it 'should save the author of the new book' do
      expect(@book.author).to eq('F. Scott Fitzgerald')
    end

    it 'should save an empty array of rentals' do
      expect(@book.rentals.size).to eq(0)
    end
  end

  context 'to_json method' do
    it 'should convert the a Book object to a hash format' do
      expected_data = {
        id: 1,
        title: 'The Great Gatsby',
        author: 'F. Scott Fitzgerald',
        rentals: []
      }
      expect(@book.to_json).to eq(expected_data)
    end
  end

  context 'new_rental method' do
    it 'should add a new object of the Rental class to the rentals array' do
      teacher = Teacher.new(28, 'Mathematics', 49, 'Roger Smith')
      rental = Rental.new(90, @book, teacher, '2023-04-10')
      @book.new_rental(rental)
      expect(@book.rentals).to include(rental) # include the new rental object in the rentals array
    end
  end
end
