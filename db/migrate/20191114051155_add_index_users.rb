# frozen_string_literal: true

class AddIndexUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, %i[provider uid], unique: true
  end
end
