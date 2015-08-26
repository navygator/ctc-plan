class SchoolsController < BaseController
  private
  def school_params
    params.require(:school).permit(:name)
  end
end
