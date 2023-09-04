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

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_option = gets.chomp.strip.to_i
    print 'Age: '
    age = gets.chomp.strip.to_i
    print 'Name: '
    name = gets.chomp.strip
    @application.create_person(person_option, name, age)
  end

end
