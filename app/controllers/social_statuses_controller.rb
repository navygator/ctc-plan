class SocialStatusesController < BaseController
  
  private
  def social_status_params
    params.require(:social_status).permit(:name)
  end
end
