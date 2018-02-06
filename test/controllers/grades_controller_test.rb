require 'test_helper'

class GradesControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    sign_in users(:one)
    @course = courses(:one)
    @evaluation= evaluations(:one)
    @grade = grades(:one)
    @student = students(:five)
  end



  test "should get new" do
    get new_course_evaluation_grade_path(@course,@evaluation)
    assert_response :success
  end





  test "should update grade" do
    patch course_evaluation_grade_path(@course,@evaluation,@grade), params: { grade: { evaluation_id: @grade.evaluation_id, grade: 3, student_id: @grade.student_id } }
    assert_redirected_to course_evaluation_grade_path(@course,@evaluation)
  end


end
