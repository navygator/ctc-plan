class Parent < Person
  default_scope -> { where(child: false)}
end
