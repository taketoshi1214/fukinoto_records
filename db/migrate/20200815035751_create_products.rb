class CreateProducts < ActiveRecord::Migration[6.0]
  create_table :products do |t|
    t.string :title, null: false
    t.string :artist, null: false
    t.string :label, null: false
    t.decimal :year, null: false
    t.string :format, null: false
    t.string :made_in, null: false
    t.string :vinyl, null: false
    t.string :jacket, null: false
    t.decimal :price, null: false
    t.text :comment_track_list, null: false
    t.timestamps
  end
end
