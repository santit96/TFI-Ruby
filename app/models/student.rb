class Student < ApplicationRecord
  belongs_to :course
  has_many :grades , dependent: :delete_all
  validates :dni ,presence:true, uniqueness: {scope: :course , message:"Can't be the same student twice in a course"}
  validates :number ,presence:true, uniqueness: {scope: :course , message:"Can't be the same student twice in a course"}
  validates :name ,presence: true 
  validates :lastname , presence:true
  validates :email , presence:true
  after_save :create_grade

  def create_grade
  	 course.evaluations.each do |e|
        Grade.create(student_id:id,evaluation:e)   
      end
  end
end
