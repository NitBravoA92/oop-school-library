require 'json'

module DataRepository
  def find_all_books
    data = get_data('books.json')
    data.map { |book| Book.new(book['id'], book['title'], book['author']) }
  end

  def find_all_people
    people_records = []
    data = get_data('people.json')
    data.each do |p|
      person = nil
      if p['type'] == 'student'
        person = Student.new(p['id'], Classroom.new('Biology'), p['age'], p['name'],
                             parent_permission: p['parent_permission'])
        person.type = 'student'
      else
        person = Teacher.new(p['id'], p['specialization'], p['age'], p['name'])
        person.type = 'teacher'
      end
      people_records << person
    end
    people_records
  end

  def find_all_rentals(books, people)
    rentals = []
    data = get_data('rentals.json')
    data.each do |rental|
      person = people.find { |item| item.id == rental['person']['id'] }
      book = books.find { |item| item.id == rental['book']['id'] }
      rentals.push(Rental.new(rental['id'], book, person, rental['date']))
    end
    rentals
  end

  def save_books(books)
    data = books.map(&:to_json)
    insert_data('books.json', data)
  end

  def save_people(people)
    data = people.map(&:to_json)
    insert_data('people.json', data)
  end

  def save_rentals(rentals)
    data = rentals.map do |rental|
      { id: rental.id, date: rental.date, book: rental.book.to_json, person: rental.person.to_json }
    end
    insert_data('rentals.json', data)
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
