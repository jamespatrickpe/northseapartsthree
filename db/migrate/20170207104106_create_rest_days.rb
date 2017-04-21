class CreateRestDays < ActiveRecord::Migration
  include CommonColumns
  def change
    create_table :rest_days, id: false do |t|
      common_set(t)
      foreign_key_id(t, 'employee')
      remark_column(t)
      implemented_on(t)
      t.string :day, :required => true
      t.timestamps
    end
  end
end
