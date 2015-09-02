class LevelsController < BaseController
  private
  def level_params
    params.require(:level).permit(:name)
  end
end
