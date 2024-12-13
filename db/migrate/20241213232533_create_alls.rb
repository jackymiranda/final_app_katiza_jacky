class CreateAlls < ActiveRecord::Migration[7.1]
  def change
    create_table :alls do |t|

      t.string :name
      t.string :space
      t.integer :original_price
      t.integer :selling_price
      t.string :brand
      t.string :condition
      t.text :description
      t.string :owner

      t.string :image

      t.timestamps
    end
  end
end

