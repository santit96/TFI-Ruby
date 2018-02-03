require 'test_helper'

class GradeTest < ActiveSupport::TestCase

  test "when a grade is created its value should be Absent by default" do
  	c=Course.new(name:"garaed",year:Date.today.year)
  	c.save
  	e=Evaluation.new(name:"proob",date:Date.tomorrow,min_grade:7,course:c)
  	s=Student.new(name:"a",lastname:"a",dni:70,number:82,course:c)
  	s.save
  	e.save
  	g=Grade.new(student:s,evaluation:e)
  	g.save
  	assert_equal("Absent",g.grade)
  end

  test "A grade's grade should be only a number or absent" do
  	c=Course.new(name:Course.last.name+"a",year:Date.today.year)
  	c.save
  	e=Evaluation.new(name:"proob",date:Date.tomorrow,min_grade:7,course:c)
  	s=Student.new(name:"a",lastname:"a",dni:70,number:82,course:c)
  	s.save
  	e.save
  	g=Grade.new(student:s,evaluation:e,grade:5)
  	assert_equal(true,g.save)
  	g.destroy
  	g=Grade.new(student:s,evaluation:e,grade:"Absent")
  	assert_equal(true,g.save)
  	g.destroy
  	g=Grade.new(student:s,evaluation:e,grade:"Aokjiji")
  	assert_equal(false,g.save)
  end


  test "should not create two grades for the same student in a evaluation " do 
  	c=Course.new(name:Course.last.name+"a",year:Date.today.year)
  	c.save
  	e=Evaluation.new(name:"proob",date:Date.tomorrow,min_grade:7,course:c)
  	s=Student.new(name:"a",lastname:"a",dni:70,number:82,course:c)
  	s.save
  	e.save
  	g=Grade.new(student:s,evaluation:e,grade:5)
  	assert_equal(true,g.save)
  	g=Grade.new(student:s,evaluation:e,grade:7)
  	assert_equal(false,g.save)
  end
end
