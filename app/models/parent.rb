class Parent < Person
  default_scope -> { where(child: false) }
  has_many :relations
  has_many :children, class_name: 'Child', through: :relations
end
