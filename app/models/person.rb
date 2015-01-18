class Person < ActiveRecord::Base
  def full_name
    "#{self.last_name} #{self.first_name} #{self.middle_name}"
  end
end
