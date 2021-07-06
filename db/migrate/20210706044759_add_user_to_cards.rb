# frozen_string_literal: true

class AddUserToCards < ActiveRecord::Migration[6.1]
  def change
    add_reference :cards, :user, foreign_key: true, after: :column_id
  end
end
