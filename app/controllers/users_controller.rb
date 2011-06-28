class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_user, :only => [ :edit, :update ]

  access_control do
    allow :admin
  end

  def index
    @users = User.page params[:page]
  end

  def role_list
    @roles = Role.where( [ "name LIKE ?", "%#{ params[:q] }%" ] )
    render :json => @roles.map(&:attributes)
  end

  def update
    attributes = params[:user].except(:password) if params[:user][:password].blank?
    if @user.update_attributes( attributes || params[:user] )
      return redirect_to users_path
    else
      render :edit
    end
  end

  private
  def set_user
    @user ||= User.find params[:id]
  end
end