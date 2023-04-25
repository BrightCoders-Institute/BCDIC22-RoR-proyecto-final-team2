class AddImageUrlToPhones < ActiveRecord::Migration[7.0]
  def change
    add_column :phones, :image_url, :string
  end
end
