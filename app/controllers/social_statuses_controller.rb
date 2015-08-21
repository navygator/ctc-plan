class SocialStatusesController < BaseController
  
  private
  def social_status_params
    params.require(:social_status).permit(:name, :status_type_id)
  end
end
