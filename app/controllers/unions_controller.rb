class UnionsController < BaseController

private
  def union_params
    params.require(:union).permit(:name, :department_id, :started_at, :closed_at)
  end
end
