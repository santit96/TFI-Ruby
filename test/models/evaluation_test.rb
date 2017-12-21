#require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	test "should not create, evaluation year must be greater or equal than curse year" do
		c=Course.new(name:"Evalluation",year:Date.today.year)
		c.save
		e=Evaluation.new(name:"PruebaEval2",date:1.year.ago,min_grade:4,course:c)
		assert_equal(false,e.save)
		e.destroy
		c.destroy
	end

	test "should not destroy when evaluation has grades" do
		c=Course.new(name:Course.last.name+"a",year:Date.today.year)
		e=Evaluation.new(name:"Evas3",date:Date.today,min_grade:4,course:c)
		s=Student.new(name:"stud8",lastname:"d",dni:143,number:1125,course:c)
		e.save
		s.save
		assert_equal(false,e.destroy)
		s.destroy
		e.destroy
		assert_not_equal(Evaluation.last,e)
		c.destroy
	end

	test "should not create two evaluation with same name and course" do
			c=Course.new(name:Course.last.name+"a",year:Date.today.year)
			c.save
			e1=Evaluation.new(name:"Evas3",date:Date.today,min_grade:4,course:c)
			e2=Evaluation.new(name:"Evas3",date:Date.tomorrow,min_grade:4,course:c)
			e1.save
			assert_equal(false,e2.save)
			e1.destroy
			e2.destroy
			c.destroy
	end

	test "should approve student" do
		c=Course.new(name:Course.last.name+"a",year:Date.today.year)
		e=Evaluation.new(name:"111",date:Date.today,min_grade:4,course:c)
		s=Student.new(name:"stud8",lastname:"d",dni:143,number:1125,course:c)
		c.save
		e.save
		s.save
		grade=s.grades.detect{|g| g.evaluation==e}
		assert_equal("Absent",grade.grade)
		grade.grade=8
		grade.save
		assert_equal("Approved",e.status(s))
		s.destroy
		e.destroy
		c.destroy
	end

	test "should disapproved student" do 
		c=Course.new(name:Course.last.name+"a",year:Date.today.year)
		e=Evaluation.new(name:"Evs3",date:Date.today,min_grade:4,course:c)
		s=Student.new(name:"stud8",lastname:"d",dni:143,number:1125,course:c)
		c.save
		e.save
		s.save
		grade=s.grades.detect{|g| g.evaluation==e}
		assert_equal("Absent",grade.grade)
		grade.grade=2
		grade.save
		assert_equal("Disapproved",e.status(s))
		s.destroy
		e.destroy
		c.destroy
	end

	test "number of grades resume must be correct" do
		c=Course.new(name:Course.last.name+"a",year:Date.today.year)
		e=Evaluation.new(name:"Evvv",date:Date.today,min_grade:4,course:c)
		s1=Student.new(name:"stud1",lastname:"d",dni:1,number:13,course:c)
		s2=Student.new(name:"stud2",lastname:"d",dni:13,number:12,course:c)
		s3=Student.new(name:"stud3",lastname:"d",dni:1222,number:10,course:c)
		c.save
		e.save
		s1.save
		s2.save
		s3.save
		grade1=s1.grades.detect{|g| g.evaluation==e}
		grade2=s2.grades.detect{|g| g.evaluation==e}
		grade3=s3.grades.detect{|g| g.evaluation==e}
		grade1.grade=9
		grade1.save
		grade2.grade=8
		grade2.save
		grade3.grade=1
		grade3.save
		assert_equal(2,e.approved_count)
		assert_equal(1,e.disapproved_count)
		assert_equal(0,e.absent_count)
		assert_equal(66,e.approved_percentage)
		s1.destroy
		s2.destroy
		s3.destroy
		e.destroy
		c.destroy
	end
	
end
