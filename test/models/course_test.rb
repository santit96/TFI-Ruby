#require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should create course" do
  	c=Course.new name:"Ruby" , year:2018
  	assert_equal(true,c.save)
  	assert_equal("Ruby",c.name)	
  	assert_equal(2018,c.year)		
  	c.destroy
  end

   test "should not create course, name and year must be unique" do
  	c=Course.new name:"Ruby" , year:2017
  	d=Course.new name:"Ruby" , year:2017
  	c.save
  	assert_equal(false,d.save)	
  	d.destroy
  	c.destroy
  end
  test "should not crete course with a year from the past" do
  		c=Course.new name:"Chaul" , year:2014
  		assert_equal(false,c.save)
  end
  test "should not destroy course with evaluations" do
  	c=Course.new name:"no destruir" , year:2017
  	c.save
  	e=Evaluation.new name: "ev1" ,date:Date.today, min_grade:4 , course_id:c.id
  	e.save
  	assert_equal(c.destroy,false)	
  	e.destroy
  	c.destroy
  end
end
