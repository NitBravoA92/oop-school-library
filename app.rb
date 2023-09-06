require_relative 'classes/person'
require_relative 'classes/student'
require_relative 'classes/classroom'
require_relative 'classes/teacher'
require_relative 'classes/capitalize_decorator'
require_relative 'classes/trimmer_decorator'
require_relative 'classes/book'
require_relative 'classes/rental'
require_relative 'repository/handlers/data_json'

class App
  include DataRepository

  attr_accessor :books_list, :people_list, :rentals_list

  def initialize
    @books_list = find_all_books
    @people_list = find_all_people
    @rentals_list = find_all_rentals(@books_list, @people_list)
  end

  def list_books
    @books_list.each_with_index do |b, index|
      puts "#{index}) Title: #{b.title}, Author: #{b.author}"
    end
  end

  def list_people
    @people_list.each_with_index do |p, index|
      puts "#{index}) [#{p.type}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}"
    end
  end

  def list_rentals(person_id)
    @rentals_list.each do |r|
      puts "Date: #{r.date}, Book #{r.book.title} by #{r.book.author}" if r.person.id == person_id
    end
  end

  def create_person(option_selected, name, age)
    id = @people_list.length + 1
    case option_selected
    when 1 then new_person = create_student(id, name, age)
    when 2 then new_person = create_teacher(id, name, age)
    else
      puts 'Invalid option...'
      return nil
    end
    @people_list << new_person
    puts 'Person created successfully!'
  end

  def create_book(title, author)
    id = (@books_list.length + 1)
    new_book = Book.new(id, title, author)
    @books_list << new_book
    puts 'Book created successfully'
  end

  def create_rental(book_index, person_index, date)
    if @books_list.empty? || @people_list.empty?
      puts 'Ups! There are no people or books available...'
    elsif @books_list.length > book_index && @people_list.length > person_index
      id = @rentals_list.length + 1
      rental = Rental.new(id, @books_list[book_index], @people_list[person_index], date)
      @rentals_list << rental
      puts 'Rental created successfully!'
    else
      puts 'Rental not created'
    end
  end

  def finish
    save_books(@books_list)
    save_people(@people_list)
    save_rentals(@rentals_list)
  end

  private

  def create_student(id, name, age)
    print 'Has parent permission? [Y/N]:'
    has_permission = gets.chomp.strip.upcase
    classroom = Classroom.new('Biology')
    new_student = Student.new(id, classroom, age, name, parent_permission: has_permission == 'Y')
    new_student.type = 'Student'
    new_student
  end

  def create_teacher(id, name, age)
    print 'Specialization: '
    specialization = gets.chomp.strip
    new_teacher = Teacher.new(id, specialization, age, name)
    new_teacher.type = 'Teacher'
    new_teacher
  end
end
