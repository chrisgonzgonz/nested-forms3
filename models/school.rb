class School
  attr_accessor :name, :size, :location
  attr_reader :courses

  def initialize
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

end