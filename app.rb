require_relative "./classes/person"
require_relative "./classes/student"
require_relative "./classes/classroom"
require_relative "./classes/teacher"
require_relative "./classes/capitalize_decorator"
require_relative "./classes/trimmer_decorator"
require_relative "./classes/book"
require_relative "./classes/rental"

class App
  attr_accessor :books_list, :people_list, :rentals_list

  def initialize
    @books_list = []
    @people_list = []
    @rentals_list = []
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
    case option_selected
    when 1 then new_person = create_student(name, age)
    when 2 then new_person = create_teacher(name, age)
    else
      puts "Invalid option..."
      return nil
    end
    @people_list << new_person
    puts "Person created successfully!"
  end

  def create_book(title, author)
    new_book = Book.new(title, author)
    @books_list << new_book
    puts "Book created successfully"
  end

  def create_rental(book_index, person_index, date)
    if @books_list.empty? || @people_list.empty?
      puts "Ups! There are no people or books available..."
    else
      if @books_list.length > book_index && @people_list.length > person_index
        rental = Rental.new(@books_list[book_index], @people_list[person_index], date)
        @rentals_list << rental
        puts "Rental created successfully!"
      else
        puts "Rental not created"
      end
    end
  end
end
