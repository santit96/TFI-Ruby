class Student < ApplicationRecord
  belongs_to :course
  has_many :grades , dependent: :delete_all
  validates :dni , uniqueness: {scope: :course , message:"Can't be the same student twice in a course"}
  validates :number , uniqueness: {scope: :course , message:"Can't be the same student twice in a course"}
  after_save :create_grade

  def create_grade
  	 course.evaluations.each do |e|
          g=Grade.new()
          g.student_id=id
          g.evaluation=e 
          g.save
      end
  end
end
