class AddCommentsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :post_id
      t.integer :user_id
      t.timestamp
    end
    add_foreign_key :comments, :users
    add_foreign_key :comments, :posts
  end
end
