class AasmCreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table(:orders) do |t|
      t.string :aasm_state

      t.timestamps
    end
  end
end
