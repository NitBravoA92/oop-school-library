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

end
