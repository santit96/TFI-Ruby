require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase

	setup do
    	@course = courses(:one)
    	@evaluation = evaluations(:one)
  	end

	test "should not create, evaluation year must be greater or equal than course year" do
		e=Evaluation.new(name:"PruebaEval2",date:'2014-01-01',min_grade:4,course:@course)
		refute e.save
		assert_includes e.errors[:date], "must be greater than course year"
	end

	test "should not destroy when evaluation has grades" do
		refute @evaluation.destroy
		assert_includes @evaluation.errors[:base], "Cannot delete record because dependent grades exist"
	end

	test "should not be two evaluation with same name and course" do
			e2=Evaluation.create(name:@evaluation.name,date:'2018-05-02',min_grade:4,course:@evaluation.course)
			refute e2.valid?
			assert_includes e2.errors[:name], "Can't be the same evaluation twice in a course"
	end

	test "should approve student" do
		s=Student.create(name:"stud8",lastname:"d",dni:143,number:1125,course:@course)
		grade=s.grades.detect{|g| g.evaluation==@evaluation}
		assert_equal("Absent",grade.grade)
		grade.grade=8
		grade.save
		assert_equal("Approved",@evaluation.status(s))
	end

	test "should disapproved student" do 	
		s=Student.create(name:"stud8",lastname:"d",dni:143,number:1125,course:@course)
		grade=s.grades.detect{|g| g.evaluation==@evaluation}
		assert_equal("Absent",grade.grade)
		grade.grade=2
		grade.save
		assert_equal("Disapproved",@evaluation.status(s))
	end

	test "number of grades resume must be correct" do
		s1= students(:one)
		s2= students(:two)
		s3= students(:three)
		grade1= grades(:one)
		grade2= grades(:two)
		grade3= grades(:three)
		assert_equal(2,@evaluation.approved_count)
		assert_equal(1,@evaluation.disapproved_count)
		assert_equal(0,@evaluation.absent_count)
		assert_equal(66,@evaluation.approved_percentage)
	end
	
end
