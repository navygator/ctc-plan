class Department < ActiveRecord::Base
  scope :active, -> { where('(started_at <= :now AND closed_at > :now) OR closed_at is null', now: Time.zone.now) }

  has_many :unions
  has_many :sections
end
