require_relative 'app'
require_relative 'user_interface_actions'

def main
  puts 'Welcome to School Library App!'
  app = App.new
  user_actions = UserInterfaceActions.new(app)
  user_actions.menu
end

main
