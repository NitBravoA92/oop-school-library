class Book
  attr_accessor :id, :title, :author, :rentals

  def initialize(id, title, author)
    @id = id
    @title = title
    @author = author
    @rentals = []
  end

  def to_json(*_args)
    {
      id: @id,
      title: @title,
      author: @author,
      rentals: @rentals.map(&:id)
    }
  end

  def new_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end
end
