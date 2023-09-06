require "json"

module DataRepository
  def find_all_books
    data = get_data("books.json")
    data.map { |book| Book.new(book["id"], book["title"], book["author"]) }
  end

  def get_data(filename)
    file = "./repository/data/#{filename}"
    return [] unless File.exist?(file)
    JSON.parse(File.read(file))
  end

  def insert_data(filename, data)
    File.write("./repository/data/#{filename}", JSON.pretty_generate(data))
  end
end
