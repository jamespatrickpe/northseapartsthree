class Link < ApplicationRecord

  include UUIDConcern
  include Remark
  include Contactable

  belongs_to :contact_detail

  validates :service, length: { in: 2..64 }, presence: true
  validates :url, length: { in: 2..512 }, presence: true
  validates_presence_of :contact_detail

  searchable_string(:service)
  searchable_string(:url)

end
