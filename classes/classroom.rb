class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def enter_student(student)
    @students.push(student)
    student.classroom = self # make this student part of this classroom
  end
end
