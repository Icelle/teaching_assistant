require_relative './final_grade.rb'

class Student
  include Comparable
  attr_reader :first_name, :last_name, :assignment_grades, :final_grade

  # @param [String] first_name - student's first name
  # @param [String] last_name - student's last name
  # @param [Array] grades - student's grades
  #When we make this object, we should have all the info to create it upfront.
  def initialize(first_name, last_name, grades)
    @first_name        = first_name
    @last_name         = last_name
    @assignment_grades = grades
    @final_grade       = FinalGrade.new(self)
  end

  def <=>(student2)
    (@last_name + @first_name) <=> (student2.last_name + student2.first_name)
  end
end
