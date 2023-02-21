class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.boolean :permisos_vender
      t.boolean :permisos_comprar

      t.timestamps
    end
  end
end
