require 'test_helper'

class CampusTest < ActiveSupport::TestCase
  def setup
    assert @campus = Factory.create( :campus )
  end
  
  test "name must be present" do
    assert campus = Factory.build( :campus, :name => nil)
    assert campus.invalid?
  end
  
  test "name mus be unique" do
    assert campus = Factory.build( :campus, :name => @campus.name )
    assert campus.invalid?
  end
  
  test "can create" do
    assert_difference "Campus.count" do
      assert Factory.create( :campus )
    end
  end
  
  test "can update" do
    assert @campus.name = "new custom name"
    assert @campus.valid?
    assert @campus.save
  end
  
  test "can delete" do
    assert_difference "Campus.count", -1 do
      @campus.delete
    end
  end
end
