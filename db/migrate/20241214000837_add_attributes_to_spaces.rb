class AddAttributesToSpaces < ActiveRecord::Migration[7.1]
  def change
    add_column :spaces, :name, :string
    add_column :spaces, :space, :string
    add_column :spaces, :original_price, :decimal
    add_column :spaces, :selling_price, :decimal
    add_column :spaces, :brand, :string
    add_column :spaces, :condition, :string
    add_column :spaces, :description, :text
    add_column :spaces, :owner, :string
    add_column :spaces, :image, :string
  end
end
