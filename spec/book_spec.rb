require_relative "../classes/book"
require_relative "../classes/teacher"
require_relative "../classes/rental"

describe Book do
  before :each do
    @book = Book.new(1, "The Great Gatsby", "F. Scott Fitzgerald")
  end
end
