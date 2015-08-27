class DocumentsController < BaseController
  before_action :load_child
  
  def index
    add_breadcrumb t(controller_name), send("child_#{controller_name}_path"), :title => t(controller_name)
  end
  
  def new
    add_breadcrumb t(controller_name), send("child_#{controller_name}_path"), :title => t(controller_name)
    add_breadcrumb t(:new), send("new_child_#{controller_name.singularize}_path"), :title => t(:new)
  end  

  def edit
    add_breadcrumb t(controller_name), send("child_#{controller_name}_path"), :title => t(controller_name)
    add_breadcrumb t(:edit), send("edit_child_#{controller_name.singularize}_path"), :title => t(:edit)
  end
  
  private
  def load_child
    @child = Child.find(params[:child_id]) if params[:child_id]
  end
  
  def document_params
    params.require(:document).permit(:document_type_id, :scan)
  end
end
