# frozen_string_literal: true

class AddDefaultUserToUsers < ActiveRecord::Migration[5.1]
  def change
    if User.find_by(id: -1)
    else
      User.create(email: 'notarealemail@makers.com', password: 'admin', id: -1)
    end
  end
end
