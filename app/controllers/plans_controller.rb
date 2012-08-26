class PlansController < ApplicationController
  inherit_resources

  def create
    super do |format|
      format.html{ redirect_to :action => :index }
    end
  end

  def update
    super do |format|
      format.html{ redirect_to :action => :index }
    end
  end

  #def new
  #  @plan = Plan.new
  #end
  #
  #def index
  #  @plans = Plan.all
  #end
  #
  #def create
  #  @plan = Plan.new(params[:plan])
  #
  #  if @plan.save
  #    redirect_to :action => :index
  #  else
  #    render :action => :new
  #  end
  #end
  #
  #def edit
  #  @plan = Plan.find(params[:id])
  #end
  #
  #def update
  #  @plan = Plan.find(params[:id])
  #
  #  if @plan.update_attributes(params[:plan])
  #    redirect_to :action => :index
  #  else
  #    render :action => :edit
  #  end
  #end
  #
  #def destroy
  #  @plan = Plan.find(params[:id])
  #  @plan.destroy
  #  redirect_to :action => :index
  #end
end