require 'test_helper'

class EvaluationsControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    sign_in users(:one)
    @course= courses(:one)
    @evaluation = evaluations(:one)
  end

  test "should get index" do
    get course_path(@course)  
    assert_response :success
  end

  test "should get new" do
    get new_course_evaluation_path(@course)
    assert_response :success
  end

  test "should create evaluation" do
    assert_difference('Evaluation.count') do
      post course_evaluations_path(@course, evaluation: { course_id: @evaluation.course_id, date: @evaluation.date, min_grade: @evaluation.min_grade, name: "ultima Fecha" })
    end

    assert_redirected_to course_evaluation_path(@course,Evaluation.last)
  end

  test "should show evaluation" do
    get course_evaluation_path(@course,@evaluation)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_evaluation_path(@course,@evaluation)
    assert_response :success
  end

  test "should update evaluation" do
    patch course_evaluation_path(@course,@evaluation), params: { evaluation: { course_id: @evaluation.course_id, date: @evaluation.date, min_grade: @evaluation.min_grade, name: @evaluation.name } }
    assert_redirected_to course_evaluation_path(@course,@evaluation)
  end

  test "should destroy evaluation" do
    assert_difference('Evaluation.count', -1) do
      delete course_evaluation_path(@course,evaluations(:three))
    end

    assert_redirected_to course_path(@course)
  end
end
