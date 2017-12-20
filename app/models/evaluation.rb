class Evaluation < ApplicationRecord
  belongs_to :course
  has_many :grades , dependent: :restrict_with_error
  accepts_nested_attributes_for :grades
  validates :name , uniqueness: {scope: :course , message:"Can't be the same evaluation twice in a course"}
  validates :min_grade ,  numericality: { greater_than: 0}
  before_save :validates_date

  def validates_date
  	if self.date.year < course.year then
  		self.errors.add(:date,"must be greater than course year")
  		throw :abort
  	end
  end

  def status(student)
  	grades.detect{|g| g.student==student}.status(self)
  end



  def approved_count
    grades.select {|g| g.status(self)=="Approved" }.count
  end

  def disapproved_count
    grades.select {|g| g.status(self)=="Disapproved"  }.count
  end


  def absent_count
    grades.select {|g| g.status(self)=="-"  }.count
  end

  def approved_percentage
    begin
      ((approved_count * 100) / (grades.count)).to_s
    rescue ZeroDivisionError
      "There are no students in this course"
    end
  end


end
