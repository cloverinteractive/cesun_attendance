class Assignment < ActiveRecord::Base
  validates :code,  :presence => true, :uniqueness => true, :length => { :is => 8}
  validates :term, :name,  :presence => true
end
