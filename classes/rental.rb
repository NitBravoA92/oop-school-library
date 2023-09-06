class Rental
  attr_accessor :id, :date, :book, :person

  def initialize(id, book, person, date)
    @id = id
    @date = date
    @book = book
    @person = person

    book.new_rental(self)
    person.new_rental(self)
  end
end
