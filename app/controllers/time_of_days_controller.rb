class TimeOfDaysController < BaseController
private
  def time_of_day_params
    params.require(:time_of_day).permit(:name)
  end
end
