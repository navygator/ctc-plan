class StudyingYearsController < BaseController

private
  def studying_year_params
    params.require(:studying_year).permit(:name)
  end
end
