class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :decription
      t.integer :price_in_ents

      t.timestamps
    end
  end
end
