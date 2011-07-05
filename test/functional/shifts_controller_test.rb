require 'test_helper'

class ShiftsControllerTest < ActionController::TestCase
  def setup
    assert @shift = Factory.create(:shift)
    assert @user  = Factory.create(:user)
  end

  test "can reach index if admin" do
    sign_in_with_role @user, :admin

    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:shifts)
  end

  test "should get new shift if admin" do
    sign_in_with_role @user, :admin

    get :new
    assert_response :success
    assert_template :new
  end

  test "should create shift with admin role" do
    sign_in_with_role @user, :admin

    assert_difference('Shift.count') do
      post :create, :shift => { :description => 'Nocturno 2'}
    end
    assert_redirected_to shift_path( assigns :shift )
  end

  test "can reach edit if admin" do
    sign_in_with_role @user, :admin

    get :edit, :id => @shift.id
    assert assigns(:shift)
    assert_equal @shift, assigns(:shift)
  end

  test "should update shift if admin" do
    sign_in_with_role @user, :admin

    assert shift = @shift.description
    put :update, :id => @shift.id, :shift => { :description => 'Nocturno 1' }
    assert_not_equal shift, @shift.reload.description
    assert_redirected_to shift_path( assigns :shift )
  end

  test "should delete shift if admin" do
    sign_in_with_role @user, :admin

    assert_difference 'Shift.count', -1 do
      delete :destroy, :id => @shift.id
    end

    assert_redirected_to shifts_url
  end
end
