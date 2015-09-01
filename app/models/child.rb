class Child < Person
  default_scope -> { where(child: true) }

  has_many :relations
  has_many :parents, through: :relations
  has_many :documents
  has_many :achievements, as: :achievable

  belongs_to :family_status, class_name: 'SocialStatus'
  belongs_to :person_status, class_name: 'SocialStatus'
  
  has_and_belongs_to_many :groups  
  
end
