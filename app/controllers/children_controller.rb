class ChildrenController < BaseController
  def index
    @children = Person.where(child: true)
  end
private
  def child_params
    params.require(:child).permit(:first_name, :last_name, :middle_name, :birthday, :address, :phone, :child)
  end
end