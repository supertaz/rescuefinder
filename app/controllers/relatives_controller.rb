class RelativesController < ApplicationController
  def index
    @relatives = Relative.all
  end
  
  def show
    @relative = Relative.find(params[:id])
  end
  
  def new
    @relative = Relative.new
  end
  
  def create
    @relative = Relative.new(params[:relative])
    if @relative.save
      flash[:notice] = "Successfully created relative."
      redirect_to @relative
    else
      render :action => 'new'
    end
  end
  
  def edit
    @relative = Relative.find(params[:id])
  end
  
  def update
    @relative = Relative.find(params[:id])
    if @relative.update_attributes(params[:relative])
      flash[:notice] = "Successfully updated relative."
      redirect_to @relative
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @relative = Relative.find(params[:id])
    @relative.destroy
    flash[:notice] = "Successfully destroyed relative."
    redirect_to relatives_url
  end
end
