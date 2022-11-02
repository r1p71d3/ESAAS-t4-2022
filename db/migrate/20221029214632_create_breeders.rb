class CreateBreeders < ActiveRecord::Migration
  def change
    create_table :breeders do |t|
      t.string :name
      t.string :country
      t.string :address
      t.string :price
      t.float :rating

      t.timestamps null: false
    end
  end
end
