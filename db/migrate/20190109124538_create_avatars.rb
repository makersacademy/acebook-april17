class CreateAvatars < ActiveRecord::Migration[5.1]
  def change
    create_table :avatars do |t|
      t.string :username
      t.string :image

      t.timestamps
    end
  end
end
