class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...10_000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end
