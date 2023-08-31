class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def enter_student(student)
    @students.push(student) unless @students.include?(student)
    student.classroom = self
  end
end
