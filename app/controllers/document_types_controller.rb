class DocumentTypesController < BaseController
  private 
  def document_type_params
    params.require(:document_type).permit(:name)
  end
end
