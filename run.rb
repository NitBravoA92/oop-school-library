require './classes/person'
require './classes/student'
require './classes/classroom'
require './classes/teacher'
require './classes/capitalize_decorator'
require './classes/trimmer_decorator'
require './classes/book'
require './classes/rental'

# create an object with the data of the person: Rick
person1 = Person.new(15, 'Rick', parent_permission: true)
p person1.can_use_services?

# create an object with the data of the teacher: Henry
teacher1 = Teacher.new('Data Science', 40, 'Henry')
p "#{teacher1.name}, age: #{teacher1.age}, specialization: #{teacher1.specialization}"
p teacher1.can_use_services?

# Create an object with the data of the Classroom: 'Biology'
classroom1 = Classroom.new('Biology')

# create an object with the data of the student: James and enter this student into the Classroom: 'Biology'
student1 = Student.new(classroom1, 19, 'James', parent_permission: false)

p "#{student1.name}, age: #{student1.age}, classroom: #{student1.classroom.label}"
p student1.play_hooky
p student1.can_use_services?

# Test the Decorator design pattern implementation
person2 = Person.new(22, 'maximilianus')
p person2.correct_name
capitalized_person2 = CapitalizeDecorator.new(person2)
p capitalized_person2.correct_name
capitalized_trimmed_person2 = TrimmerDecorator.new(capitalized_person2)
p capitalized_trimmed_person2.correct_name

# create an object with the data of the Book: The Gene: An Intimate History
book1 = Book.new('The Gene: An Intimate History', 'Siddhartha Mukherjee')

person3 = Person.new(29, 'Jack')
p person3.correct_name

# Jack rents the Book: The Gene: An Intimate History on August 30, 2023
rent_book1 = Rental.new(book1, person3, '2023-08-30')
p "#{rent_book1.person.correct_name} rents the Book: #{rent_book1.book.title} on #{rent_book1.date}"
