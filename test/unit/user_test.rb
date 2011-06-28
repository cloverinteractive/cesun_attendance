require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = Factory.create :user, :email => 'totally@different.com', :username => 'different'
    @custom_email, @custom_username = 'other.teacher@school.com', 'other.teacher'
  end

  test "password must be at least 6 chars" do
    assert user = Factory.build( :user, :password => '12345' )
    assert user.invalid?
  end

  test "password must be at most 128 chars" do
    assert user = Factory.build(:user, :password => "*" * 129 )
    assert user.invalid?
  end

  test "username must be in a proper format" do
    assert user = Factory.build( :user, :username => '@#!)(na&^' )
    assert user.invalid?
  end

  test "username must be present" do
    assert user = Factory.build( :user, :username => nil, :email => @custom_email )
    assert user.invalid?
  end

  test "username must be unique" do
    assert user = Factory.build( :user, :email => @custom_email, :username => 'different' )
    assert user.invalid?
  end

  test "email must be present" do
    assert user = Factory.build( :user, :email => nil )
    assert user.invalid?
  end

  test "email must be unique" do
    assert user = Factory.build( :user, :email => 'totally@different.com' )
    assert user.invalid?
  end

  test "create user" do
    assert user = Factory.build( :user, :email => @custom_email, :username => @custom_username )
    assert_difference 'User.count' do
      user.save
    end
  end

  test "delete user" do
    assert_difference 'User.count', -1 do
      @user.delete
    end
  end

  test "update user" do
    assert @user.update_attributes :username => @custom_username
    assert @custom_username, @user.username
  end

  test "user can have roles" do
    assert @user.respond_to? :has_role?
    assert !@user.has_role?( :admin )
  end

  test "user can be assigned to one role" do
    assert @user.respond_to? :has_role!
    assert @user.has_role!( :admin )
    assert @user.has_role?( :admin )
  end
end
