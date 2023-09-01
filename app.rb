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
