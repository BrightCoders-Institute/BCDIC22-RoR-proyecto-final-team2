class AddBrandToPhones < ActiveRecord::Migration[7.0]
  def change
    add_column :phones, :brand, :string
  end
end
