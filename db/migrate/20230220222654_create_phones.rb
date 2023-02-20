class CreatePhones < ActiveRecord::Migration[7.0]
  def change
    create_table :phones do |t|
      t.integer :id_especificaciones
      t.integer :user_id
      t.float :precio

      t.timestamps
    end
  end
end
