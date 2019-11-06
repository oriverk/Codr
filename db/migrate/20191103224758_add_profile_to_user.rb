# frozen_string_literal: true

class AddProfileToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile, :text
  end
end
