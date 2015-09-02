class Achievement < ActiveRecord::Base
  belongs_to :achievement_type
  belongs_to :level
  belongs_to :grade
  belongs_to :achievable, polymorphic: true
  
  def visible_params
    if achievement_type && achievement_type.visible_params
      achievement_type.visible_params.split(',')
    else
      []
    end
  end
end
