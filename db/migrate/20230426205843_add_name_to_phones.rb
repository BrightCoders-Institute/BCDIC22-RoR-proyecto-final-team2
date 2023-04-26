class AddNameToPhones < ActiveRecord::Migration[7.0]
  def change
    add_column :phones, :name, :string
  end
end
