#require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should create course" do
  	c=Course.new name:"Ruby" , year:2017
  	assert_equal(c.save,true)	
  end
end
