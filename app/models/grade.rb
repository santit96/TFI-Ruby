class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :evaluation
  validates :student , uniqueness: {scope: :evaluation, message:"A student can't have two notes for the same evaluation"}
  validates_each :grade do |record, attr, value|
    record.errors.add(attr, "must be a positive number or 'Absent'") if (!(Float(value) != nil rescue false) and value.downcase!="absent" )
  end
  

  def status(evaluation)
  	if grade.downcase=="absent" then
  		"-"
  	else
  		grade.to_f >= evaluation.min_grade ? "Approved" : "Disapproved"
  	end
  end

end