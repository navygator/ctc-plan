class ParentsController < BaseController
  def index
    @parents = Person.where(child: false)
  end
private
  def parent_params
    params.require(:parent).permit(:first_name, :last_name, :middle_name, :birthday, :address, :phone)
  end
end