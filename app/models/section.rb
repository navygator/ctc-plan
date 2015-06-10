class Section < ActiveRecord::Base
  belongs_to :department
  
  has_many :groups, as: :groupable
end
