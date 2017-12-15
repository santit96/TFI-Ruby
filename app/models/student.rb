class Student < ApplicationRecord
  belongs_to :course
  has_many :grades
  validates :dni , uniqueness: {scope: :course , message:"Can't be the same student twice in a course"}
  validates :number , uniqueness: {scope: :course , message:"Can't be the same student twice in a course"}
end
