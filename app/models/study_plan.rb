class StudyPlan < ActiveRecord::Base
  belongs_to :campus

  validates_presence_of :name, :campus
  validates_uniqueness_of :name, :scope => :campus_id
end