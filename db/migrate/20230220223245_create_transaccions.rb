class CreateTransaccions < ActiveRecord::Migration[7.0]
  def change
    create_table :transaccions do |t|
      t.integer :id_comprador
      t.integer :id_vendedor
      t.integer :telefono_id
      t.string :status
      t.float :ganancia

      t.timestamps
    end
  end
end
