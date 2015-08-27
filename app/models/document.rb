class Document < ActiveRecord::Base
  belongs_to :document_type
  
  has_attached_file :scan, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :scan, content_type: /\Aimage\/.*\Z/  
end
