require_relative "../classes/person"
require_relative "../classes/decorator"

describe Decorator do
  before :each do
    @person = Person.new(5, 17, "John", parent_permission: true) # Person inherits from Nameable
    @decorator = Decorator.new(@person)
  end
end
