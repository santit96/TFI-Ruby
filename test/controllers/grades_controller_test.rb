require 'test_helper'

class GradesControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    sign_in users(:one)
    @course = courses(:one)
    @evaluation= evaluations(:one)
    @grade = grades(:one)
    @student = students(:five)
  end

  test "should get index" do
    get grades_course_path(@course)
    assert_response :success
  end

  test "should get new" do
    get new_course_evaluation_grade_path(@course,@evaluation)
    assert_response :success
  end

  test "should create grade" do
    assert_difference('Grade.count') do
      post course_evaluation_grades_path(@course,@evaluation, grade: { evaluation_id: @grade.evaluation_id, grade: @grade.grade, student_id: @student.id })
    end

    assert_redirected_to course_evaluation_grade_path(@course,@evaluation)
  end


  test "should get edit" do
    get edit_course_evaluation_grade_path(@course,@evaluation,@grade)
    assert_response :success
  end

  test "should update grade" do
    patch course_evaluation_grade_path(@course,@evaluation,@grade), params: { grade: { evaluation_id: @grade.evaluation_id, grade: @grade.grade, student_id: @grade.student_id } }
    assert_redirected_to course_evaluation_grade_path(@course,@evaluation)
  end


end
