require 'descriptive_statistics'

class GradeSummary

  attr_reader :avg, :min, :max, :standard_deviation
  # @param [Array] students - array of students
  def initialize(students)
    scores = get_final_scores(students)
    @avg = get_avg(scores)
    @min = scores.min
    @max = scores.max
    @standard_deviation = scores.standard_deviation
  end

  def get_final_scores(students)
    return students.map {|student| student.final_grade.number_grade}
  end

  def get_avg(scores)
    (scores.reduce(:+).to_f/scores.size).round(1)
  end
end
