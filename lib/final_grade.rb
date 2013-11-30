class FinalGrade
  attr_reader :number_grade, :letter_grade

  #here, we initialize the final grade instance with a student object because we don't have the number grade(need to calculate it).
  def initialize(student)
    @number_grade = set_number_grade(student)
    @letter_grade = set_letter_grade
  end

  # @param [Student] student - you need to pass in student so you can get access to student and call the grades
  def set_number_grade(student)
    (student.assignment_grades.map {|assignment_grade| assignment_grade.grade}.reduce(:+).to_f/student.assignment_grades.size).round(1)
  end

  def set_letter_grade
    case
    when @number_grade >= 90
      return "A"
    when @number_grade >= 80
      return "B"
    when @number_grade >= 70
      return "C"
    when @number_grade >= 60
      return "D"
    else
      return "F"
    end
  end
end
