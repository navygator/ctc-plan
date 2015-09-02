class GradesController < BaseController
  respond_to :html, :json
  
  def search
    @results = Grade.where(achievement_type_id: params[:achievement_type_id])
    respond_with @results
  end
  
  private
  def grade_params
    params.require(:grade).permit(:name, :achievement_type_id)
  end
end

