class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :evaluation
  validates :student , uniqueness: {scope: :evaluation, message:"A student can't have two notes for the same evaluation"}

  
  def status(evaluation)
  	if grade==-1 then
  		"-"
  	else
  		grade >= evaluation.min_grade ? "Approved" : "Disapproved"
  	end
  end
end