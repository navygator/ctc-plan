class SectionsController < BaseController
private
  def section_params
    params.require(:section).permit(:name, :department_id, :started_at, :closed_at)
  end
end