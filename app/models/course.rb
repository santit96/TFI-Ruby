class Course < ApplicationRecord
	has_many :students , dependent: :restrict_with_error
	has_many :evaluations , dependent: :restrict_with_error
	validates :name ,presence: true , uniqueness: {scope: :year , message: "Shouldn't be the same course twice in a year"} 
	validates :year ,presence: true , numericality: {only_integer:true , greater_than: 1.years.ago.year}
end
