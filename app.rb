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
end
