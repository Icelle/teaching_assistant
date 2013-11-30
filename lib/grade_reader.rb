require_relative './student.rb'
require 'csv'
require_relative './assignment_grade.rb'

class GradeReader
  attr_reader :grade_book

  def initialize(filename = './assets/grade_book.csv')
    raise "#{filename} does not exist" unless File.exist? filename
    @filename = filename
    @grade_book = load_grade_book
  end

  def load_grade_book
    grade_book = []
    csv_table = CSV.table(@filename).to_a
    csv_table.delete_at(0)
    csv_table.each do |row|
      names      = row[0].split
      first_name = names[0]
      last_name  = names[1]
      grades     = row[1..-1].map {|grade| AssignmentGrade.new(grade)}
      student    = Student.new(first_name, last_name, grades)
      grade_book << student
    end
    grade_book
  end

  def print_grades
    @grade_book.each do |student|
      puts "#{student.first_name} #{student.last_name}: #{student.assignment_grades.map {|assignment_grade| assignment_grade.grade}.join(",")}"
    end
  end
end
