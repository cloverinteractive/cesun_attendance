class Assignment < ActiveRecord::Base
  has_one     :shift
  belongs_to  :teacher
  has_and_belongs_to_many   :profesion, :chekins, :study_plan
  validates   :code,  :presence => true,
                      :uniqueness => true,
                      :length => { :is => 8}
  validates   :name,  :presence => true
  validates   :term,  :presence => true
end
