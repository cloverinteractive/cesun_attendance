class ShiftsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_shift, :only => [ :show, :edit, :update, :destroy ]

  access_control do
    allow :admin
  end

  def index
    @shifts = Shift.page params[:page]
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(params[:shift])
    if @shift.save
      redirect_to @shift, :notice => t('messages.success')
    else
      render :new
    end
  end

  def update
    if @shift.update_attributes params[:shift]
      redirect_to @shift, :notice => t('messages.success')
    else
      render :edit
    end
  end

  def destroy
    @shift.destroy
    redirect_to  shifts_url
  end

  private
  def find_shift
    @shift = Shift.find params[:id]
  end
end
