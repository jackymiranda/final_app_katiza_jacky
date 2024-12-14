class CreateSpaces < ActiveRecord::Migration[6.0]
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :space
      t.decimal :original_price
      t.decimal :selling_price
      t.string :brand
      t.string :condition
      t.text :description
      t.string :owner
      t.string :image

      t.timestamps
    end
  end
end
