class Student
  attr_reader :first_name, :last_name, :grades

  # @param [String] first_name - student's first name
  # @param [String] last_name - student's last name
  # @param [Array] grades - student's grades
  def initialize(first_name, last_name, grades)
    @first_name = first_name
    @last_name  = last_name
    @grades     = grades
  end
end
