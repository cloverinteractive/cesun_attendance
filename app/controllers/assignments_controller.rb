class AssignmentsController < ApplicationController
  before_filter :set_assignment, :only => [:show, :edit, :update, :destroy]
  
  def index
    @assignments = Assignment.all
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(params[:assignment])
      if @assignment.save
        redirect_to(@assignment, :notice => 'Assignment was successfully created.')
      else
        render :action => "new"
    end
  end

  def update
    if @assignment.update_attributes(params[:assignment])
      redirect_to(@assignment, :notice => 'Assignment was successfully updated.') 
    else
      render :action => "edit"
    end
  end

  def destroy
    @assignment.destroy
    redirect_to(assignments_url)
  end

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end
end

  
