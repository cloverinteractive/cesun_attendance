require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  def setup
    @shift = Factory.create :shift, :description => 'new_one'
  end

  test 'must have description' do
    assert shift = Factory.build( :shift, :description => nil)
    assert shift.invalid?
  end

  test 'must be unique' do
    assert shift = Factory.build( :shift, :description => 'new_one' )
    assert shift.invalid?
  end

  test "must be_minimum 5 chars" do
    assert shift = Factory.build( :shift, :description => "*" * 4 )
    assert shift.invalid?
  end

  test "must be maximum 25 chars" do
    assert shift = Factory.build( :shift, :description => "*" * 26 )
    assert shift.invalid?
  end

  test 'create shift' do
      assert shift = Factory.build(:shift, :description => 'new_two' )
      assert_difference 'Shift.count' do
        shift.save
      end
  end

  test "update shift" do
    assert @shift.update_attributes :description => 'new_one_updated'
  end

  test "delete shift" do
    assert_difference 'Shift.count', -1 do
      @shift.delete
    end
  end
end