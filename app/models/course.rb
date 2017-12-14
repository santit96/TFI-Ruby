class Course < ApplicationRecord
	has_many :students
	has_many :evaluations
	validates :name , uniqueness: {scope: :year , message: "Shouldn't be the same course twice in a year"}
end
