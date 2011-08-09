class ProfessionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_profession, :only => [ :show, :edit, :update, :destroy ]
  
  access_control do
    allow :admin
  end
  
  def index
    @professions = Profession.all
  end
  
  def new
    @profession = Profession.new
  end
  
  def destroy
    @profession = Profession.find(params[:id])
    @profession.destroy
    redirect_to professions_url
  end

  def edit
    @profession = Profession.find(params[:id])
  end
  
  def update
    @profession = Profession.find(params[:id])
    if @profession.update_attributes(params[:profession])
      redirect_to professions_url, :notice => t('messages.success')
    else
      redirect_to(professions_url, :notice => @profession.errors)
    end
  end

  def create
    @profession = Profession.new(params[:profession])
    if @profession.save
      flash[:notice] = t('messages.success')
      redirect_to professions_url
    else
      redirect_to(professions_url, :notice => @profession.errors)
    end
  end
  
  private
  def set_profession
    @study_plan = Profession.find params[:id]
  end
  
end
