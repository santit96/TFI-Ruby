require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  setup do
    @course = courses(:one)
  end

  test "should create course" do
   	  assert_difference("Course.count") do
      course= Course.create(name:"Catedra",year:Date.today.year)
    end
  end

   test "Course name must be unique in a year" do
  	d=Course.create name:@course.name , year:@course.year
  	
    refute d.valid?
    refute d.errors[:name].empty?
  end
  test "should not create course with a year from the past" do
  		c=Course.create name:"Chaul" , year:2014
  		refute c.valid?
      refute c.errors[:year].empty?

  end
  test "should not destroy course with evaluations" do
  	refute @course.destroy
    refute @course.errors[:base].empty?
  end

end
