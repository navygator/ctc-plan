class GroupsController < BaseController
  
  def edit
    super
    children_ids = @group.children.pluck(:id)
    @available = Child.where('id not in (?)', children_ids.size > 0 ? children_ids : [-1])
  end
  
  def create
    @group = Group.new(group_params)
  
    # Unless the client has been specified already (via a combination
    # of client_id and client_type, attempt to discover the client
    # via its global id.
    unless @group.groupable.present?
      @group.groupable = GlobalID::Locator.locate group_params[:groupable_id]
    end
  
    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: 'Группа успешно создана' }
        format.json { render action: 'show', status: :created, location: @group }
      else
        format.html { render action: 'new' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  # PATCH/PUT /tasks/1.json
  def update
    params_for_update = group_params
  
    # The Locator will return nil if the URI is not valid (e.g. it is
    # a bare id) or if the record is not found, in which case we
    # fall back to the regular update procedure below.
    if GlobalID::Locator.locate group_params[:groupable_id]
      @group.groupable = GlobalID::Locator.locate params_for_update[:groupable_id]
      params_for_update.delete :groupable_id
    end
  
    respond_to do |format|
      if @group.update(params_for_update)
        format.html { redirect_to groups_path, notice: 'Группа успешно обновлена' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end  

  private
  def group_params
    params.require(:group).permit(:name, :groupable_id, :subject_id, :time_of_day_id)
  end
end
