class Rental
  attr_accessor :date, :book, :person

  def initialize(book, person, date)
    @date = date
    @book = book
    @person = person
    book.new_rental(self)
    person.new_rental(self)
  end
end
