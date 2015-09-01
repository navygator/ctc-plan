class AchievementsController < BaseController
  before_action :load_child
  
  def index
    add_breadcrumb t(controller_name), send("child_#{controller_name}_path"), :title => t(controller_name)
  end
  
  def new
    add_breadcrumb t(controller_name), send("child_#{controller_name}_path"), :title => t(controller_name)
    add_breadcrumb t(:new), send("new_child_#{controller_name.singularize}_path"), :title => t(:new)
  end  

  def create
    if @child.achievements.create(achievement_params)
      flash[:success] = t('flash.success.create', resource: t(model_name.underscore))
      redirect_to edit_child_path(@child)
    else
      render 'new'
    end
  end

  def edit
    add_breadcrumb t(controller_name), send("child_#{controller_name}_path"), :title => t(controller_name)
    add_breadcrumb t(:edit), send("edit_child_#{controller_name.singularize}_path"), :title => t(:edit)
  end
  
  def update
    if @resource.update_attributes(send("#{model_name.underscore}_params"))
      flash[:success] = t('flash.success.update', resource: t(model_name.underscore))
      redirect_to edit_child_path(@child)
    else
      render 'edit'
    end
  end  

  private
  def load_child
    @child = Child.find(params[:child_id]) if params[:child_id]
  end
  
  def achievement_params
    params.require(:achievement).permit(:achievement_type_id, :child_id, :description, :date)
  end
end
