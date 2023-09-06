require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(id, specialization, age, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*_args)
    {
      id: @id,
      type: 'teacher',
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      specialization: @specialization,
      rentals: @rentals.map(&:id)
    }
  end
end
