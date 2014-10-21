class DepartmentsController < BaseController
private
  def department_params
    params.require(:department).permit(:name, :started_at, :closed_at)
  end
end
