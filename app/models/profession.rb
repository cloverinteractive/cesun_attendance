class Profession < ActiveRecord::Base
  validates :name, :code, :presence => true, :uniqueness => true
  validates :code, :length => { :minimum => 2 }
end
