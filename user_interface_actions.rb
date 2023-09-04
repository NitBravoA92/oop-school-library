class UserInterfaceActions
  def initialize(application)
    @application = application
  end

  def display_books
    puts 'Books:'
    @application.list_books
  end

end
