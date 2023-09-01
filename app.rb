require './classes/person'
require './classes/student'
require './classes/classroom'
require './classes/teacher'
require './classes/capitalize_decorator'
require './classes/trimmer_decorator'
require './classes/book'
require './classes/rental'

class App
  attr_reader :title
  attr_accessor :books_list, :people_list, :rentals_list

  def initialize
    @title = 'Welcome to School Library App!'
    @books_list = []
    @people_list = []
    @rentals_list = []
  end

  def list_books
    puts 'Books:'
    @books_list.each { |b| puts "Title: #{b.title}, Author: #{b.author}" } unless @books_list.empty?
  end

  def list_people
    puts 'People:'
    @people_list.each { |p| puts "[#{p.type}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}" } unless @people_list.empty?
  end

  def list_rentals
    print 'ID of person:'
    person_id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals_list.each do |r|
      puts "Date: #{r.date}, Book #{r.book.title} by #{r.book.author}" if r.person.id == person_id
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_option = gets.chomp.strip.to_i
    print 'Age: '
    age = gets.chomp.strip.to_i
    print 'Name: '
    name = gets.chomp.strip

    case person_option
    when 1 then create_student(name, age)
    when 2 then create_teacher(name, age)
    else
      puts 'Invalid option...'
      return nil
    end

    puts 'Person created successfully!'
  end

  def create_book
    print 'Title: '
    title = gets.chomp.strip
    print 'Author: '
    author = gets.chomp.strip
    new_book = Book.new(title, author)
    @books_list << new_book
    puts 'Book created successfully'
  end

  def create_rental
    if @books_list.empty? || @people_list.empty?
      puts 'Ups! There are no people or books available...'
    else
      puts 'Select a book from the following list by number'
      list_books_for_rental
      book_index = gets.chomp.strip.to_i

      puts "\nSelect a person from the following list by number (not id)"
      list_people_for_rental
      person_index = gets.chomp.strip.to_i

      if @books_list.length > book_index && @people_list.length > person_index
        print "\nDate:"
        date = gets.chomp.strip
        rental = Rental.new(@books_list[book_index], @people_list[person_index], date)
        @rentals_list << rental
        puts 'Rental created successfully!'
      else
        puts 'Rental not created'
      end
    end
  end

  def menu_options
    puts "\nPlease choose an option by enterin a number:"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id'
    puts '7. Exit'
  end

  def menu
    option = 0

    loop do
      menu_options
      option = gets.chomp.strip.to_i
      case option
      when 1 then list_books
      when 2 then list_people
      when 3 then create_person
      when 4 then create_book
      when 5 then create_rental
      when 6 then list_rentals
      else
        puts 'Thank you for using this app!'
        break
      end
    end
  end

  def run
    puts @title
    menu
  end

  private

  def list_books_for_rental
    @books_list.each_with_index do |b, index|
      puts "#{index}) Title: #{b.title}, Author: #{b.author}"
    end
  end

  def list_people_for_rental
    @people_list.each_with_index do |p, index|
      puts "#{index}) [#{p.type}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}"
    end
  end

  def create_student(name, age)
    print 'Has parent permission? [Y/N]:'
    has_permission = gets.chomp.strip.upcase
    classroom = Classroom.new('Biology')
    new_student = Student.new(classroom, age, name, parent_permission: has_permission == 'Y')
    new_student.type = 'Student'
    @people_list << new_student
  end

  def create_teacher(name, age)
    print 'Specialization: '
    specialization = gets.chomp.strip
    new_teacher = Teacher.new(specialization, age, name)
    new_teacher.type = 'Teacher'
    @people_list << new_teacher
  end
end
