class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.text :description
      t.integer :mod_id, null: false

      t.timestamps null: false
    end
    add_index :subs, :mod_id
    add_index :subs, :title, unique: true
  end
end
