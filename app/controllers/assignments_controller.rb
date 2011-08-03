class AssignmentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_assignment, :only => [ :show, :edit, :update, :destroy ]

  access_control do
    allow :admin
  end

  def index
    @assignments = Assignment.page params[:page]
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new params[:assignment]
    if @assignment.save
      redirect_to @assignment, :notice => t('messages.success')
    else
      render :action => "new"
    end
  end

  def update
    if @assignment.update_attributes params[:assignment]
      redirect_to @assignment, :notice => t('messages.success')
    else
      render :action => "edit"
    end
  end

  def destroy
    @assignment.destroy
    redirect_to assignments_url
  end

  def set_assignment
    @assignment = Assignment.find params[:id]
  end
end
