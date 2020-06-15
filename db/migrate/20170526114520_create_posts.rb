class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :text
      t.string :poster_username
      t.string :recipient_username

      t.timestamps
    end
  end
end
