require './classes/person'

# create an object with the data of Rick
person1 = Person.new(15, 'Rick', parent_permission: true)
p person1.can_use_services?
