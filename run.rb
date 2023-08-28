require './classes/person'
require './classes/student'
require './classes/teacher'

# create an object with the data of the person: Rick
person1 = Person.new(15, 'Rick', parent_permission: true)
p person1.can_use_services?

# create an object with the data of the student: James
student1 = Student.new(10, 19, 'James', parent_permission: false)
p "#{student1.name}, age: #{student1.age}, classroom: #{student1.classroom}"
p student1.play_hooky
p student1.can_use_services?

# create an object with the data of the teacher: Henry
teacher1 = Teacher.new('Data Science', 40, 'Henry')
p "#{teacher1.name}, age: #{teacher1.age}, specialization: #{teacher1.specialization}"
p teacher1.can_use_services?
