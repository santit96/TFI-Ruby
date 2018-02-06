require 'test_helper'

class StudentTest < ActiveSupport::TestCase

   setup do
    @grade= grades(:one)
    @student= students(:one)
    @course_with_one_evaluation = courses(:two)
    @evaluation = evaluations(:one)
    @course= courses(:one)
  end
    
  test "should create grade per evaluation when creating a student" do
  	assert_difference("Grade.count") do
  	     Student.create(name:"santi",email:"s@s.s",lastname:"t",course:@course_with_one_evaluation,dni:7545432,number:9)
    end
  end

  test "should delete grades when a student is deleted" do
    assert_difference("Grade.count",-1) do
        @student.destroy
    end
  end


  test "should not create repeated students in the same course" do
    assert_difference("Student.count",0)do
      Student.create(name:"san",lastname:"t",course:@course,dni:@student.dni,number:9)
    end
  end


end
