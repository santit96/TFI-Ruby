#require 'test_helper'

class EvaluationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	test "should not create, evaluation year must be greater or equal than curse year" do
		c=Course.new(name:"PruebaEval4",year:Date.today.year)
		c.save
		e=Evaluation.new(name:"PruebaEval2",date:1.year.ago,min_grade:4,course:c)
		assert_equal(false,e.save)
		e.destroy
		c.destroy
	end

	test "should not destroy when evaluation has grades" do
		c=Course.new(name:"Pueden123",year:Date.today.year)
		e=Evaluation.new(name:"Evas3",date:Date.today,min_grade:4,course:c)
		s=Student.new(name:"stud8",lastname:"d",dni:143,number:1125,course:c)
		e.save
		s.save
		assert_equal(false,e.destroy)
		s.destroy
		e.destroy
		assert_not_equal(Evaluation.last,e)
	end

	
end
