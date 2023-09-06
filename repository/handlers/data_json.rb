require "json"

module DataRepository
  def find_all_books
    data = get_data("books.json")
    data.map { |book| Book.new(book["id"], book["title"], book["author"]) }
  end

  def find_all_people
    people_records = []
    data = get_data('people.json')
    data.each do |p|
      person = nil
      if p['type'] == 'student'
        person = Student.new(p['id'], Classroom.new('Biology'), p['age'], p['name'], parent_permission: p['parent_permission'])
        person.type = 'student'
      else
        person = Teacher.new(p['id'], p['specialization'], p['age'], p['name'])
        person.type = 'teacher'
      end
      people_records << person
    end
    people_records
  end

  def save_books(books)
    data = books.map { |book| book.to_json }
    insert_data('books.json', data)
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
