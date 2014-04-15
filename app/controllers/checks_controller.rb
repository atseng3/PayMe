class ChecksController < ApplicationController
  def index 
    
  end
  
  def new
    @check = Check.new()
    render :new
  end
  
  def create
    @check = Check.new(params[:checks])
  end
  
  def show
    
  end
  
  def destroy
    
  end
  
end
