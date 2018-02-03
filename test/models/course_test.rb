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
    assert_includes d.errors[:name], "Shouldn't be the same course twice in a year" 
  end
  test "should not create course with a year from the past" do
  		c=Course.create name:"Chaul" , year:2014
  		refute c.valid?
      assert_includes c.errors[:year], "must be greater than #{1.years.ago.year}"

  end
  test "should not destroy course with evaluations" do
  	refute @course.destroy
    assert_includes @course.errors[:base], "Cannot delete record because dependent students exist"
  end

end
