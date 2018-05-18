# frozen_string_literal: true

# migrate fields
class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :surname, :string
    add_column :users, :username, :string
  end
end
