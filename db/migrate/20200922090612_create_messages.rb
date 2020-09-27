class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :admin, null: false, foreign_key: true
      t.string :content, null: false
      t.timestamps
    end
  end
end
