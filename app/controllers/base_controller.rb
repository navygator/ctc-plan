class BaseController < ApplicationController
  before_filter :find_model

  def index
    
  end

  def new
    
  end

  def create
    
  end

  def show
    
  end

  def update
    
  end

  def destroy
    
  end
  

  private
  def find_model
    @resource = Base.find(params[:id]) if params[:id]
  end
end
