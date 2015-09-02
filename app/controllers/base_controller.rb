class BaseController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_model, except: [:index]
  before_filter :find_collection, only: [:index]
  
  respond_to :html
  
  add_breadcrumb "Домой", :root_path

  def index
    add_breadcrumb t(controller_name), send("#{controller_name}_path"), :title => t(controller_name)
    respond_with @collection
  end

  def new
    add_breadcrumb t(controller_name), send("#{controller_name}_path"), :title => t(controller_name)
    add_breadcrumb t(:new), send("new_#{controller_name.singularize}_path"), :title => t(:new)
  end

  def create
    if model.create(send("#{model_name.underscore}_params"))
      flash[:success] = t('flash.success.create', resource: t(model_name.underscore))
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def show
    respond_with @resource
  end

  def edit
    add_breadcrumb t(controller_name), send("#{controller_name}_path"), :title => t(controller_name)
    add_breadcrumb t(:edit), send("edit_#{controller_name.singularize}_path"), :title => t(:edit)
  end

  def update
    if @resource.update_attributes(send("#{model_name.underscore}_params"))
      flash[:success] = t('flash.success.update', resource: t(model_name.underscore))
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  def destroy
    @resource.destroy
    flash[:success] = t('flash.success.delete', resource: t(model_name.underscore))
    redirect_to action: :index
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
