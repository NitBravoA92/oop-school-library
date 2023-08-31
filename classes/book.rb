class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def new_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end
end
