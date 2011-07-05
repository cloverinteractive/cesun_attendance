class Shift < ActiveRecord::Base
  validates :description, :presence => true,
                          :length => { :minimum => 5, :maximum =>25 },
                          :uniqueness => true
end
