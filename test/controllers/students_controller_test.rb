require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
    
  setup do
    sign_in users(:one)
    @course = courses(:one)
    @student = students(:one)
  end

  test "should get index" do
    get course_students_path(@course)
    assert_response :success
  end

  test "should get new" do
    get new_course_student_path(@course)
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post course_students_path(@course , student: { course_id: @student.course_id, dni: @student.dni + 80, lastname: @student.lastname,email:"s@s.s", name: @student.name, number: @student.number + '80'})
    end

    assert_redirected_to course_student_path(@course,Student.last)
  end

  test "should show student" do
    get course_student_path(@course, @student)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_student_path(@course,@student)
    assert_response :success
  end

  test "should update student" do
    patch course_student_path(@course,@student), params: { student: { course_id: @student.course_id, dni: @student.dni, lastname: @student.lastname, name: @student.name, number: @student.number } }
    assert_redirected_to course_student_path(@course,@student)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete course_student_path(@course,@student)
    end

    assert_redirected_to course_students_path(@course)
  end
end
