class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = [] 
    @students = []
    @grades = Hash.new { |k, v| k[v] = []}
  end

  def name 
    @name
  end 
  
  def slogan
    @slogan
  end 

  def teachers
    @teachers
  end 
  
  def students 
    @students
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(str)
    if @students.length < @student_capacity
        @students << str
        return true
    elsif @students.length >= @student_capacity
        @student_capacity 
        return false 
    end
  end

  def enrolled?(str)
    @students.map(&:downcase).include?(str.downcase)
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(str, num)
    if enrolled?(str)
        @grades[str] << num
        return true
    else
        return false 
    end
  end

  def num_grades(str)
    @grades[str].length
  end

  def average_grade(str)
    if enrolled?(str) && num_grades(str) != 0
    @grades[str].sum / num_grades(str)
    elsif 
        nil
    end
  end

end
