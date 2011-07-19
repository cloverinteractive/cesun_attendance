require 'test_helper'

class StudyPlansControllerTest < ActionController::TestCase
  def setup
    assert @user = Factory.create(:user)
  end
  
  test "should get index" do
    sign_in_with_role @user, :admin
    get :index
    assert_response  :success
    assert_not_nil assigns(:study_plans)
  end
end
