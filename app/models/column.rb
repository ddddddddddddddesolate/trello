# frozen_string_literal: true

class Column < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :user, presence: true
end
