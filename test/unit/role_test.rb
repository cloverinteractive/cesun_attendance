require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  def setup
    @user = Factory.create( :user )
  end

  test 'can create role through model' do
    assert role = Role.new( :name => :coordinator )
    assert role.valid?

    assert_difference 'Role.count' do
      assert role.save!
    end
  end

  test 'user can have 1 or many roles' do
    assert @user.has_role!( :admin )
    assert @user.has_role!( :coordinator )
    assert_equal 2, @user.roles.count
  end

  test 'user can own other objects' do
    assert object = Factory.create( :user )
    assert @user.has_role!( :owner, object )
    assert @user.has_role?( :owner, object )
  end

  test 'user can lose a role' do
    assert @user.has_role!( :admin )
    assert @user.has_no_role!( :admin )
    assert_equal 0, @user.roles.count
  end
end
