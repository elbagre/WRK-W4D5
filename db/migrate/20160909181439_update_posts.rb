class UpdatePosts < ActiveRecord::Migration
  def change
    add_column :posts, :sub_id, :integer, null: false
    add_index :posts, :sub_id
  end
end
