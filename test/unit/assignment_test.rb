require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase

  test 'has_unique_code' do
    assert Factory.create( :assignment )
    assert assignment = Factory.build( :assignment)
    assert assignment.invalid?
  end  
  
  test 'has_diferent_code' do
    assert Factory.create( :assignment )
    assert assignment = Factory.build( :assignment, :code => '01ID0901')
    assert assignment.valid?
  end
  
  test 'can_update' do
    assert assignment = Factory.create( :assignment )
    assert assignment.update_attributes!( :name => 'Base de Datos')        
  end
  
  test 'can_delete' do
    assert assignment = Factory.create( :assignment )
    assert assignment.destroy
  end
  
  test 'can_create' do
    assert_difference 'Assignment.count', 3 do
      3.times{ |n| Factory.create( :assignment, :code => "01IND#{n}")}
    end
  end
end
