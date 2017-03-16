class Check < ApplicationRecord

  include GenericResourceCommon
  include ExchangeableMedium

  setup_model('check-circle',
              'check_number',
              @@routes.enterprise_accounting_and_finance_exchange_media_checks_path,
              Enterprise::AccountingAndFinance::ExchangeMedia::ChecksController )

  belongs_to :bank_account

  validates_presence_of :signatory
  validates_presence_of :payee
  validates_presence_of :bank_account
  validates_presence_of :check_number

  searchable_string(:payee_name)
  searchable_string(:signatory_name)

  def payee_name
    SystemAccount.find_by_id(payee).represent
  end

  def signatory_name
    SystemAccount.find_by_id(signatory).represent
  end

end