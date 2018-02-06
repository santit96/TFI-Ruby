class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :evaluation
  validates :student , uniqueness: {scope: :evaluation, message:"A student can't have two notes for the same evaluation"}
  validates :grade , numericality: true
  

  def status(evaluation)
  	if grade.nil? then
  		"-"
  	else
  		grade.to_f >= evaluation.min_grade ? "Approved" : "Disapproved"
  	end
  end

end