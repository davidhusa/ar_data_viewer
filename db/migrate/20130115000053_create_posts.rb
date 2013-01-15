class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.boolean :published
      t.datetime :post_at
      t.references :category

      t.timestamps
    end
    add_index :posts, :category_id
  end
end
