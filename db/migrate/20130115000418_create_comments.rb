class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.references :post
      t.boolean :is_approved
      t.boolean :is_poster
      t.string :author

      t.timestamps
    end
    add_index :comments, :post_id
  end
end
