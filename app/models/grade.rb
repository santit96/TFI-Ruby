class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :evaluation
  validates :student , uniqueness: {scope: :evaluation, message:"A student can't have two notes for the same evaluation"}
end
