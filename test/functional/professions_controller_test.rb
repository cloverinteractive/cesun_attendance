require 'test_helper'

class ProfessionsControllerTest < ActionController::TestCase
  def setup
    assert @user = Factory.create(:user)
    assert @profession = Factory.create(:profession)
    assert @update = {
      :name =>  'name112',
      :code =>  'code1212'
    }
  end

  test "admin can get index" do
    sign_in_with_role @user, :admin

    get :index
    assert_response :success
    assert assigns(:professions)
    assert assigns(:professions).include?( @profession )
    assert_template :index
  end

  test "admin can create profession" do
    sign_in_with_role @user, :admin

    assert_difference 'Profession.count' do
      post :create, :profession => Factory.attributes_for(:profession)
    end
    assert_redirected_to professions_url
  end

  test "admin can delete profession" do
    sign_in_with_role @user, :admin

    assert_difference 'Profession.count', -1 do
      delete :destroy, :id => @profession.id
    end
    assert_redirected_to professions_url
  end

  test "admin can get update" do
    sign_in_with_role @user, :admin

    assert old_name = @profession.name
    put :update, :id => @profession.id, :profession => @update
    assert assigns(:profession)
    assert_equal @profession, assigns(:profession)
    assert_not_equal old_name, @profession.reload.name
  end
end
