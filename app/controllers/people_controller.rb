class PeopleController < BaseController
private
  def person_params
    params.require(:person).permit(:first_name, :last_name, :middle_name, :birthday, :address, :phone)
  end
end
