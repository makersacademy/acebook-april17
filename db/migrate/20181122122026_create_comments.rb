class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :commentable, polymorphic: true, index: true

      t.timestamps
    end

    add_index :comments, :commentable_id
  end
end
