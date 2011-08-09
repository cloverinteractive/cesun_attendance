require 'test_helper'

class ProfessionTest < ActiveSupport::TestCase
  def setup
    @profession = Factory.create :profession
  end
  
  test "create profession" do
    assert profession = Factory.build(:profession)
    assert_difference 'Profession.count' do
      profession.save
    end
  end

   test "name should be present" do
      assert profession = Factory.build(:profession, :name => nil)
      assert profession.invalid?
    end

   test "code should be present" do
      assert profession = Factory.build(:profession, :code => nil)
      assert profession.invalid?
    end

    test "profession must be unique" do
      assert profession = Factory.build(:profession)
      assert profession.valid?
    end
end
