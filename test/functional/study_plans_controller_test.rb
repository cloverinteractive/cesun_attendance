require 'test_helper'

class StudyPlansControllerTest < ActionController::TestCase
  def setup
    assert @user = Factory.create(:user)
    assert @campus = Factory.create(:campus)
    assert @study_plan = Factory.create(:study_plan)
  end

  test "should get index" do
    sign_in_with_role @user, :admin
    get :index
    assert_response  :success
    assert_template  :index
    assert_not_nil assigns(:study_plans)
  end

  test "should get new study plans" do
    sign_in_with_role @user, :admin
    get :new
    assert_response :success
    assert_template :new
  end

  test "should create study plans" do
    sign_in_with_role @user, :admin
    assert_difference('StudyPlan.count') do
      post :create, :study_plan => { :name => 'IDS Nuevo Plan', :campus_id => @campus.id }
    end
    assert_redirected_to study_plan_path(assigns(:study_plan))
  end

  test "should update study plans" do
    sign_in_with_role @user, :admin
    study_plan = @study_plan.name
    put :update, :id => @study_plan.id, :study_plan => { :name => 'nuevo' }
    assert_not_equal study_plan, @study_plan.reload.name
    assert_redirected_to study_plan_path(assigns(:study_plan))
  end

  test "should delete study plans" do
    sign_in_with_role @user, :admin
    assert_difference('StudyPlan.count', -1) do
      delete :destroy, :id => @study_plan.id
    end
    assert_response :redirect
  end
end