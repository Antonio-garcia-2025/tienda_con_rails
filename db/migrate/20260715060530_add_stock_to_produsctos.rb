class AddStockToProdusctos < ActiveRecord::Migration[8.1]
  def change
    add_column :productos, :stock, :integer
  end
end
