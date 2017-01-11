class ContactDetail < ApplicationRecord

  include GenericResourceCommon
  setup_model('fa-book',
              'label',
              @@routes.enterprise_general_management_contact_details_path,
              Enterprise::GeneralManagement::ContactDetailsController )

  belongs_to :contactable, polymorphic: true
  has_many :telephone_numbers
  has_many :locations
  has_many :links

  def selector_option_label
    # Represent won't work for some reason; Workaround Method till it does
    begin
      puts contactable_type.constantize
    rescue => e
      puts id
      puts contactable_id
      puts e
    end

    contactable_type.constantize.find_by_id(contactable_id).represent + ' | ' + label
  end

  validates :label, length: { in: 2..64 }
  validates_presence_of :contactable_id
  validates :contactable_type, presence: true, inclusion: { in: %w(SystemAccount Branch)}

  def contactable_representative
    self.contactable_type.constantize.find_by_id(contactable_id).represent
  end

  def contactable_link
    self.contactable_type.constantize.class_variable_get(:@@resource_path) + '/' + contactable_id
  end

  def associated_telephone_numbers
    TelephoneNumber.where(contact_detail_id: id)
  end

  def associated_links
    Link.where(contact_detail_id: id)
  end

  def associated_locations
    Location.where(contact_detail_id: id)
  end

end