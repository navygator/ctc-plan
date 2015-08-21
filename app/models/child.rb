class Child < Person
  default_scope -> { where(child: true) }
  has_many :relations
  has_many :parents, through: :relations
end
