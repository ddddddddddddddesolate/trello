# frozen_string_literal: true

class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.references :column, null: false, foreign_key: true
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
