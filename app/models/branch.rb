class Branch < ApplicationRecord

  include GenericResourceCommon
  include ContactableResource

  setup_model('pagelines',
              'name',
              @@routes.enterprise_general_management_branches_path,
              Enterprise::GeneralManagement::BranchesController)

  has_many :contact_details, as: :contactable, :dependent => :destroy
  has_many :employees

  searchable_string(:name)
  searchable_string(:description)

end
