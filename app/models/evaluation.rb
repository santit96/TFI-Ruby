class Evaluation < ApplicationRecord
  belongs_to :course
  has_many :grades
  validates :name , uniqueness: {scope: :course , message:"Can't be the same evaluation twice in a course"}
end