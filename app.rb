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

end
