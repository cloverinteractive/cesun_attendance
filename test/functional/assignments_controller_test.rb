require 'test_helper'

class AssignmentsControllerTest < ActionController::TestCase
  setup do
    assert @assignment = Factory.create( :assignment )
    assert @user = Factory.create( :user )
    sign_in_with_role @user, :admin
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assignment" do
    assert_difference 'Assignment.count' do
      post :create, :assignment => Factory.attributes_for( :assignment )
    end

    assert_redirected_to assignment_path( assigns(:assignment) )
  end

  test "should show assignment" do
    get :show, :id => @assignment.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @assignment.id
    assert_response :success
  end

  test "should update assignment" do
    put :update, :id => @assignment.id, :assignment => Factory.attributes_for( :assignment )
    assert_redirected_to assignment_path(assigns(:assignment))
  end

  test "should destroy assignment" do

    assert_difference 'Assignment.count', -1 do
      delete :destroy, :id => @assignment.id
    end

    assert_redirected_to assignments_path
  end
end
