require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase

	setup do
    	@course = courses(:one)
    	@evaluation = evaluations(:one)
  	end

	test "should not create, evaluation year must be greater or equal than course year" do
		e=Evaluation.create(name:"PruebaEval2",date:'2014-01-01',min_grade:4,course:@course)
		refute e.valid?
		refute e.errors[:date].empty?
	end

	test "should not destroy when evaluation has grades" do
		refute @evaluation.destroy
		refute @evaluation.errors[:base].empty?
		end

	test "should not be two evaluation with same name and course" do
			e2=Evaluation.create(name:@evaluation.name,date:'2018-05-02',min_grade:4,course:@evaluation.course)
			refute e2.valid?
			refute e2.errors[:name].empty?
	end

	test "should approve student" do
		s=Student.create(name:"stud8",lastname:"d",dni:143,email:"s@s.s",number:1125,course:@course)
		grade=s.grades.detect{|g| g.evaluation==@evaluation}
		assert grade.grade.nil?
		grade.grade=8
		grade.save
		assert_equal("Approved",@evaluation.status(s))
	end

	test "should disapproved student" do 	
		s=Student.create(name:"stud8",lastname:"d",dni:143,email:"s@s.s",number:1125,course:@course)
		grade=s.grades.detect{|g| g.evaluation==@evaluation}
		assert grade.grade.nil?
		grade.grade=2
		grade.save
		assert_equal("Disapproved",@evaluation.status(s))
	end

	test "number of approved students must be correct" do
		assert_equal(2,@evaluation.approved_count)
	end
	
	test "number of dispproved students must be correct" do
		assert_equal(1,@evaluation.disapproved_count)
	end

	test "number of absent students must be correct" do
		assert_equal(0,@evaluation.absent_count)
	end

	test "approved percentage must be correct" do
		assert_equal(66,@evaluation.approved_percentage)
	end
end
