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
    result = false

    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_option = gets.chomp.strip.to_i
    print 'Age: '
    age = gets.chomp.strip.to_i
    print 'Name: '
    name = gets.chomp.strip

    case
    when person_option == 1 then result = self.create_student?(name, age)
    when person_option == 2 then result = self.create_teacher?(name, age)
    else 
      puts 'Invalid option...'
    end

    puts result ? 'Person created successfully!' : 'Person not created!'
  end

  def create_book
    print 'Title: '
    title = gets.chomp.strip
    print 'Author: '
    author = gets.chomp.strip
    new_book = Book.new(title, author)
    @books_list << new_book
    puts @books_list.include?(new_book) ? 'Book created successfully' : 'Book not created'
  end

  def create_rental
    if @books_list.empty? || @people_list.empty?
      message = 'It is not possible to create a rental...'
      message = "#{message}There are no books available. " if @books_list.empty?
      message = "#{message}There are no people stored." if @people_list.empty?
      puts message
    else
      puts 'Select a book from the following list by number'
      @books_list.each_with_index { |b, index| puts "#{index}) Title: #{b.title}, Author: #{b.author}" }
      book_index = gets.chomp.strip.to_i
      
      puts "\nSelect a person from the following list by number (not id)"
      @people_list.each_with_index { |p, index| puts "#{index}) [#{p.type}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}" }
      person_index = gets.chomp.strip.to_i

      if @books_list.length > book_index && @people_list.length > person_index
        print "\nDate:"
        date = gets.chomp.strip
        rental = Rental.new(@books_list[book_index], @people_list[person_index], date)
        @rentals_list << rental
      end
      puts @rentals_list.include?(rental) ? 'Rental created successfully!' : 'Rental not created'
    end
  end

  def menu
    menu_option = 0

    until menu_option == 7 do
      puts "\nPlease choose an option by enterin a number:"
      puts '1. List all books'
      puts '2. List all people'
      puts '3. Create a person'
      puts '4. Create a book'
      puts '5. Create a rental'
      puts '6. List all rentals for a given person id'
      puts '7. Exit'

      menu_option = gets.chomp.strip.to_i
      self.menu_controller(menu_option)
    end
  end

  def menu_controller(option)
    case option
    when 1
      self.list_books
    when 2
      self.list_people
    when 3
      self.create_person
    when 4
      self.create_book
    when 5
      self.create_rental
    when 6
      self.list_rentals
    when 7
      puts 'Thank you for using this app!'
    else
      puts 'Invalid Option! Try again'
    end
  end

  def run
    puts @title
    self.menu
  end

  private

  def create_classroom(label)
    new_classroom = Classroom.new(label)
    new_classroom
  end

  def create_student?(name, age)
    print 'Has parent permission? [Y/N]:'
    has_permission = gets.chomp.strip.upcase
    classroom = self.create_classroom('Biology')
    new_student = Student.new(classroom, age, name, parent_permission: has_permission === 'Y')
    new_student.type = 'Student'
    @people_list << new_student
    @people_list.include?(new_student)
  end

  def create_teacher?(name, age)
    print 'Specialization: '
    specialization = gets.chomp.strip
    new_teacher = Teacher.new(specialization, age, name)
    new_teacher.type = 'Teacher'
    @people_list << new_teacher
    @people_list.include?(new_teacher)
  end
end
