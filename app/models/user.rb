class User < ActiveRecord::Base
  enum role: [:user, :supervisor, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
  
  devise :database_authenticatable, :rememberable, :trackable
end
