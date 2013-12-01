require_relative './grade_summary.rb'

class Reporter
  def initialize(students)
    @students = students.sort
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

  def output_individual_grade_detail
    File.open('./assets/report_card.csv', 'w') do |file|
      file.write("last_name,first_name,avg_score,letter_grade\n")
      @students.each do |student|
        file.write("#{student.last_name},#{student.first_name},#{student.final_grade.number_grade},#{student.final_grade.letter_grade}\n")
      end
    end
  end

  def print_course_analytics
    grade_summary = GradeSummary.new(@students)
    puts "Average score: #{grade_summary.avg}"
    puts "Minimum score: #{grade_summary.min}"
    puts "Maximum score: #{grade_summary.max}"
    puts "Standard deviation: #{grade_summary.standard_deviation}"
  end
end
