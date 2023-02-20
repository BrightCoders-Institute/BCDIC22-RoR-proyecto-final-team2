class AddForeignKeyToTransaccionsTable < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :transaccions, :phones, column: :id_vendedor, foreign_key: :user_id
    add_foreign_key :transaccions, :phones, column: :telefono_id, foreign_key: :id_especificaciones
    add_foreign_key :transaccions, :users, column: :id_comprador
  end
end
