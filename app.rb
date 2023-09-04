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
end
