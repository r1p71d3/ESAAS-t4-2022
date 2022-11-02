class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :type
      t.text :personality
      t.string :price

      t.timestamps null: false
    end
  end
end
