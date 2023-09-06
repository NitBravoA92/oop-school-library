require_relative "../classes/book"
require_relative "../classes/teacher"
require_relative "../classes/rental"

describe Book do
  before :each do
    @book = Book.new(1, "The Great Gatsby", "F. Scott Fitzgerald")
  end
  describe "#new" do
    it "should be able to be created" do
      expect(@book).to be_instance_of(Book)
    end

    it "should save the id of the new book" do
      expect(@book.id).to eq(1)
    end

    it "should save the title of the new book" do
      expect(@book.title).to eq("The Great Gatsby")
    end

    it "should save the author of the new book" do
      expect(@book.author).to eq("F. Scott Fitzgerald")
    end

    it "should save an empty array of rentals" do
      expect(@book.rentals.size).to eq(0)
    end
  end
end
