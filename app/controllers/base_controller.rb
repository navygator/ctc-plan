class BaseController < ApplicationController
  before_filter :find_model, only: [:new, :create, :edit, :update, :show]
  before_filter :find_collection, only: :index

  def index
  end

  def new

  end

  def create
    if model.create(send("#{model_name.underscore}_params"))
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @resource.update_attributes(send("#{model_name.underscore}_params"))
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  def destroy
    
  end
  

  class << self
    def collection_actions
      [:index, :destroy]
    end
    
    def resource_actions
      [:show, :create, :update, :new]
    end
  end
  protected
  def model
    model_name.constantize
  end

  def model_name
    controller_name.singularize.classify
  end

  def find_model
    if params[:action] == 'new'
      @resource = model_name.constantize.new
    else
      @resource = model_name.constantize.find(params[:id]) if params[:id]
    end
    instance_variable_set("@#{controller_name.singularize}", @resource)
  end

  def find_collection
    @collection = model_name.constantize.all
    instance_variable_set("@#{controller_name}", @collection)
  end
end
