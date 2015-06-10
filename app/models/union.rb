class Union < ActiveRecord::Base
  scope :active, -> { where('(started_at <= :now AND closed_at > :now) OR closed_at is null', now: Time.zone.now) }

  belongs_to :department
  
  has_many :groups, as: :groupable
end
