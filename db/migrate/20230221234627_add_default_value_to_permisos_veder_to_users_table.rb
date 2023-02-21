class AddDefaultValueToPermisosVederToUsersTable < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :permisos_vender, :boolean, default: "1"
  end
end
