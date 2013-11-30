class Reporter
  def initialize(students)
    @students = students
  end

  def print_grades
    @students.each do |student|
      puts "#{student.first_name} #{student.last_name}: #{student.assignment_grades.map {|assignment_grade| assignment_grade.grade}.join(",")}"
    end
  end

  def print_avg_scores
    @students.each do |student|
      puts "#{student.first_name} #{student.last_name}: #{student.final_grade.number_grade}"
    end
  end

  def print_final_letter_grade
    @students.each do |student|
      puts "#{student.first_name} #{student.last_name}: #{student.final_grade.letter_grade}"
    end
  end
end
