class GradeReader

  attr_reader :grade_book

  def initialize(filename = './assets/grade_book.csv')
    raise "#{filename} does not exist" unless File.exist? filename
    @filename = filename
    @grade_book = load_grade_book
  end

  def load_grade_book
    grade_book = {}
    csv_table = CSV.table(@filename).to_a
    csv_table.delete_at(0)
    csv_table.each do |row|
      grade_book[row[0]] = row[1..-1]
    end
    grade_book
  end

  def print_grades
    @grade_book.each do |name, grades|
      puts "#{name}: #{grades.join(",")}"
    end
  end
end
