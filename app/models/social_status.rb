class SocialStatus < ActiveRecord::Base
  belongs_to :status_type

  has_many :families, class_name: 'Person', foreign_key: :family_status_id
  has_many :people, class_name: 'Person', foreign_key: :person_status_id
  
  scope :personal, -> { where(status_type_id: StatusType.where('name like ?', '%ребенка%')) }
  scope :family, -> { where(status_type_id: StatusType.where('name like ?', '%сем%')) }
end
