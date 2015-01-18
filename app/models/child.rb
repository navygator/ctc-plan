class Child < Person
  default_scope -> { where(child: true)}
end
