class PlansController < ApplicationController

  def new
    @plan = Plan.new
  end

  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plan }
    end
  end

  def create
    @plan = Plan.new(params[:plan])

    if @plan.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])

    if @plan.update_attributes(params[:plan])
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to :action => :index
  end

end
