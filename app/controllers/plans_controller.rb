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

end
