class AddDiscountPriceToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :discount_price, :decimal
  end
end
