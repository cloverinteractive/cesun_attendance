class Campus < ActiveRecord::Base
  has_many :study_plans, :dependent => :destroy

  validates_presence_of :name
  validates_uniqueness_of :name

  def to_s
    name
  end
end
