class Section < ActiveRecord::Base
  include GlobalID::Identification
  
  belongs_to :department
  has_many :groups, as: :groupable

  class << self 
    def human_name
      model_name.human
    end
  end

end
