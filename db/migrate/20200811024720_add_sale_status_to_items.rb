class AddSaleStatusToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :sale_status, :string, null: false
  end
end
