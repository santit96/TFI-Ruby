require 'test_helper'

class GradeTest < ActiveSupport::TestCase

  setup do
    @grade= grades(:one)
    @student= students(:four)
    @student2= students(:five)
    @course_with_one_evaluation = courses(:two)
    @evaluation = evaluations(:one)
  end

  test "when a grade is created its value should be null by default" do
  	g=Grade.create(student:@student,evaluation:@evaluation)
  	assert g.grade.nil?
  end

  test "A grade's grade should be only a number or nil" do
    assert_difference("Grade.count") do
      Grade.create(student:@student,evaluation:@evaluation,grade:1)
    end
    assert_difference("Grade.count") do
      Grade.create(student:@student2,evaluation:@evaluation)
    end
  end


  test "should not create two grades for the same student in a evaluation " do 
  	 assert_difference("Grade.count") do
      Grade.create(student:@student,evaluation:@evaluation,grade:1)
      Grade.create(student:@student,evaluation:@evaluation,grade:8)
    end
  end


  test "should create a grade per evaluation when a student is created" do 
     assert_difference("Grade.count") do
      Student.create(name:"hola",email:"s@s.s",lastname:"chau",dni:999,number:999,course:@course_with_one_evaluation)
    end
  end
end
