class Evaluation < ApplicationRecord
  belongs_to :course
  has_many :grades , dependent: :restrict_with_error
  accepts_nested_attributes_for :grades
  validates :name ,presence: true, uniqueness: {scope: :course , message:"Can't be the same evaluation twice in a course"}
  validates :date ,presence: true
  validates :min_grade ,presence:true, numericality: { greater_than: 0}
  validate :validates_date

  def validates_date
  	if date.year < course.year then
  		errors.add(:date,"must be greater than course year")
  	end
  end

  def status(student)
  	grades.detect{|g| g.student==student}.status(self)
  end



  def approved_count
    grades.where("grade >= #{min_grade}").count
  end

  def disapproved_count
    grades.where("grade < #{min_grade}").count
  end


  def absent_count
    grades.select {|g| g.status(self)=="Absent"  }.count
  end

  def approved_percentage
    begin
      ((approved_count * 100) / (grades.count - absent_count))
    rescue ZeroDivisionError
      "There are no students in this course"
    end
  end


end
