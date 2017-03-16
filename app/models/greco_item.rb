class GrecoItem < ApplicationRecord

  include GenericResourceCommon
  setup_model('info',
              'summary',
              @@routes.enterprise_operations_greco_warehouse_greco_items_path,
              Enterprise::Operations::GrecoWarehouse::GrecoItemsController)

  include Remark

  has_many :greco_transactions, :dependent => :destroy

  validates :name, presence: true, length: { in: 2..64 }
  searchable_string(:name)

  def get_current_stock
    current_quantity = 0
    GrecoTransaction.where(greco_item_id: id).each do |greco_transaction|
      if greco_transaction.transaction_type == 'STORE'
        current_quantity = current_quantity + greco_transaction.quantity
      else
        current_quantity = current_quantity - greco_transaction.quantity
      end
    end
    current_quantity
  end

  def summary
    name.to_s + ' | ' + remark.to_s
  end

end