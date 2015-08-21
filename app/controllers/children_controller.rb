class ChildrenController < BaseController
  def index
    @children = Person.where(child: true)
  end
private
  def child_params
    params.require(:child).permit([
      :first_name, :last_name, :middle_name, 
      :birthday, :address, :phone, :child,
      :family_status_id, :person_status_id
      ])
  end
end