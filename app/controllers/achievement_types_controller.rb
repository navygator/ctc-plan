class AchievementTypesController < BaseController
  private
  def achievement_type_params
    params.require(:achievement_type).permit(:name)
  end
end
