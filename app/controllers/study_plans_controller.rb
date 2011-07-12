class StudyPlansController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_study_plan, :only => [ :show, :edit, :update, :destroy ]

  access_control do
    allow :admin
  end

  def index
    @study_plans = StudyPlan.page params[:page]
  end

  def new
    @study_plan = StudyPlan.new
  end

  def create
    @study_plan = StudyPlan.new params[:study_plan]
    if @study_plan.save
      flash[:success] = t 'messages.success'
      redirect_to @study_plan
    else
      render :new
    end
  end

  def update
    if @study_plan.update_attributes params[:study_plan]
      flash[:success] = t 'messages.success'
      redirect_to @study_plan
    else
      render :edit
    end
  end

  def destroy
    @study_plan.destroy
    flash[:success] = t 'messages.success'
    redirect_to study_plans_path
  end

  private
  def set_study_plan
    @study_plan = StudyPlan.find params[:id]
  end
end
