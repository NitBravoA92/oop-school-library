require "json"

module DataRepository
  def find_all_books
    data = get_data("books.json")
    data.map { |book| Book.new(book["id"], book["title"], book["author"]) }
  end
end
