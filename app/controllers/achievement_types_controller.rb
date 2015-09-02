class AchievementTypesController < BaseController
  respond_to :html, :json
  
  
  private
  def achievement_type_params
    params.require(:achievement_type).permit(:name, :visible_params)
  end
end
