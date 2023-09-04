class UserInterfaceActions
  def initialize(application)
    @application = application
  end

  def display_books
    puts 'Books:'
    @application.list_books
  end

  def display_people
    puts 'People:'
    @application.list_people
  end

  def display_rentals
    print 'ID of person:'
    person_id = gets.chomp.to_i
    puts 'Rentals:'
    @application.list_rentals(person_id)
  end

end
