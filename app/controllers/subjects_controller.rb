class SubjectsController < BaseController

private
  def subject_params
    params.require(:subject).permit(:name, :union_id)
  end
end
