class Evaluation < ApplicationRecord
  belongs_to :course
  has_many :grades , dependent: :restrict_with_error
  accepts_nested_attributes_for :grades
  validates :name , uniqueness: {scope: :course , message:"Can't be the same evaluation twice in a course"}
  validates :min_grade ,  numericality: { greater_than: 0 }
  def status(student)
  	grades.detect{|g| g.student==student}.status(self)
  end
end
