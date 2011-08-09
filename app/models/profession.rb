class Profession < ActiveRecord::Base
  validates :name, :code, :presence => true
  validates  :code,
                    :length => {:minimum => 2}
  validates_uniqueness_of :name, :scope => :code
end
