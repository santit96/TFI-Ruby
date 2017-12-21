#require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    
  test "should create grade per evaluation when creating a student" do
  	course = Course.new(name:"cursito",year:Date.today.year)
    course.save
  	s=Student.new(name:"santi",lastname:"t",course:course,dni:7545432,number:9)
  	e1=Evaluation.new(name:"Ev898l",date:Date.tomorrow,min_grade:2,course:course)
  	e=Evaluation.new(name:"Ev899",date:Date.today,min_grade:2,course:course)
  	e.save
  	e1.save
  	s.save
  	assert_equal(true,Grade.exists?(student_id:s.id,evaluation:e))
  	assert_equal(true,Grade.exists?(student_id:s.id,evaluation:e1))
  	s.destroy
  	e.destroy
  	e1.destroy
  end

  test "should delete grades when a student is deleted" do
  	course = Course.new(name:Course.last.name+"a",year:Date.today.year)
    course.save
  	s=Student.new(name:"san",lastname:"t",course:course,dni:2213190,number:9)
  	e1=Evaluation.new(name:"Evl231",date:Date.tomorrow,min_grade:2,course:course)
  	e=Evaluation.new(name:"E2",date:Date.today,min_grade:2,course:course)
  	e.save
  	e1.save
  	s.save
  	assert_equal(true,Grade.exists?(student:s,evaluation:e))
  	assert_equal(true,Grade.exists?(student:s,evaluation:e1))
  	s.destroy
  	e.destroy
  	e1.destroy
  	assert_not_equal(true,Grade.exists?(student_id:s.id,evaluation:e))
  	assert_not_equal(true,Grade.exists?(student_id:s.id,evaluation:e1))
  end


  test "should not create repeated students in the same course" do
  	course = Course.new(name:Course.last.name+"a",year:Date.today.year)
    course.save
    s=Student.new(name:"san",lastname:"t",course:course,dni:22,number:9)
    s1=Student.new(name:"sandsa",lastname:"ast",course:course,dni:22,number:19)
    s3=Student.new(name:"sdsa",lastname:"ast",course:course,dni:25,number:9)
    s.save
    assert_equal(false,s1.save)
    assert_equal(false,s3.save)
  end


end
