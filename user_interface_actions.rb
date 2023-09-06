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

  def create_book
    print 'Title: '
    title = gets.chomp.strip
    print 'Author: '
    author = gets.chomp.strip
    @application.create_book(title, author)
  end

  def create_rental
    puts 'Select a book from the following list by number'
    display_books
    book_index = gets.chomp.strip.to_i

    puts "\nSelect a person from the following list by number (not id)"
    display_people
    person_index = gets.chomp.strip.to_i

    print "\nDate:"
    date = gets.chomp.strip
    @application.create_rental(book_index, person_index, date)
  end

  def menu_options
    puts "\nPlease choose an option by entering a number:
    1. List all books
    2. List all people
    3. Create a person
    4. Create a book
    5. Create a rental
    6. List all rentals for a given person id
    7. Exit"
    gets.chomp.strip.to_i
  end

  def menu
    loop do
      option = menu_options
      case option
      when 1 then display_books
      when 2 then display_people
      when 3 then create_person
      when 4 then create_book
      when 5 then create_rental
      when 6 then display_rentals
      else
        @application.finish
        puts 'Thank you for using this app!'
        break
      end
    end
  end
end
