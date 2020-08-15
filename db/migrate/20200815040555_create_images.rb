class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :product, foreign_key: true
      t.string :image, null: false
      t.timestamps
    end
  end
end
