require 'test_helper'

class ProfessionsControllerTest < ActionController::TestCase
  
  def setup
    assert @user = Factory.create(:user)
    assert @profession = Factory.build(:profession)
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
  end

  test "admin can create profession" do
    sign_in_with_role @user, :admin
    assert_difference('Profession.count') do
      post :create,:profession => Factory.attributes_for(:profession)
    end
    assert_redirected_to professions_url
  end

  test "admin can delete profession" do
    sign_in_with_role @user, :admin
    assert @profession.save!
    assert_difference('Profession.count', -1) do
      delete :destroy, :id => @profession.id
    end
    assert_redirected_to professions_url
  end

  test "admin can get update" do
    sign_in_with_role @user, :admin
    assert @profession.save!
    put :update, :id => @profession.id, :profession => @update
    assert assigns(:profession)
    assert_equal @profession, assigns(:profession)
  end

end
