class Child < Person
  default_scope -> { where(child: true) }

  has_many :relations
  has_many :parents, through: :relations

  belongs_to :family_status, class_name: 'SocialStatus'
  belongs_to :person_status, class_name: 'SocialStatus'
  
  
end
