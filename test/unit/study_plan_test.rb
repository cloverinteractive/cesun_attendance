require 'test_helper'

class StudyPlanTest < ActiveSupport::TestCase
  def setup
    assert @campus = Factory.create( :campus )
    assert @study_plan = Factory.create( :study_plan, :campus => @campus )
  end
  
  test "name must be present" do
    assert study_plan = Factory.build( :study_plan, :name => nil )
    assert study_plan.invalid?
  end
  
  test "name must be unique" do
    assert study_plan = Factory.build( :study_plan, :name => @study_plan.name, :campus => @campus )
    assert study_plan.invalid?
  end
  
  test "must belong to campus" do
    assert study_plan = Factory.build( :study_plan, :campus => nil )
    assert study_plan.invalid?
  end
  
  test "can create" do
    assert_difference "StudyPlan.count" do
      assert Factory.create( :study_plan )
    end
  end 
  
  test "can update" do
    #assert study_plan = Factory.create( :study_plan )
    assert @study_plan.name = "new custom name"
    assert @study_plan.valid?
    assert @study_plan.save
  end
  
  test "can delete" do
    #assert study_plan = Factory.create( :study_plan )
    assert_difference "StudyPlan.count", -1 do
      @study_plan.delete
    end
  end
end