require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, classroom, age, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.enter_student(self) # enter the student in the classroom when an student object is created
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def to_json(*_args)
    {
      id: @id,
      classroom: @classroom.label,
      type: 'student',
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      rentals: @rentals.map(&:id)
    }
  end
end
