require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    assert @user = Factory.create(:user)
    %w/admin teacher/.each { |role| assert Role.create!( :name => role) }
  end

  test "redirect to new user session if not authorized" do
    sign_in @user
    %w/index edit role_list/.each do |action|
      get action, :id => @user.id, :q => 'role'
      assert_redirected_to new_user_session_path
    end
  end

  test "admin can reach index" do
    sign_in_with_role @user, :admin

    get :index
    assert assigns(:users)
    assert_template :index
    assert_response :success
    assert_equal 1, assigns(:users).count
    assert_equal @user, assigns(:users).first
  end

  test "admin can reach edit" do
    sign_in_with_role @user, :admin

    get :edit, :id => @user.id
    assert assigns(:user)
    assert_equal @user, assigns(:user)
  end

  test "admin can autocomplete role list" do
    sign_in_with_role @user, :admin
    get :role_list, :q => 'adm'
    assert_match /admin/, response.body
  end

  test "admin can update user without password" do
    sign_in_with_role @user, :admin
    put :update, :id => @user.id, :user => { :password => '', :role_tokens => Role.all.map( &:id ).join(',') }
    assert assigns(:user)
    assert_equal @user, assigns(:user)
    assert @user.reload.has_role?( :teacher )
    assert_redirected_to users_path
  end

  test "admin can updte user with password" do
    assert old_hash = @user.encrypted_password

    sign_in_with_role @user, :admin
    put :update, :id => @user.id, :user  => { :password => 'supersecret_pass' }
    assert assigns( :user )
    assert_equal @user, assigns( :user )
    assert_not_equal old_hash, @user.reload.encrypted_password
  end

  test "admin can delete user" do
    sign_in_with_role @user, :admin

    assert_difference 'User.count', -1 do
      delete :destroy, :id => @user.id
      assert assigns( :user )
      assert_equal @user, assigns( :user )
    end
  end
end
