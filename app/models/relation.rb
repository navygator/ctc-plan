class Relation < ActiveRecord::Base
  belongs_to :parents
  belongs_to :child
end
