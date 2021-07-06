# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :column
  belongs_to :user
  has_many :comments, dependent: :delete_all

  validates :column, presence: true
  validates :user, presence: :true
  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :text, length: { maximum: 100 }, allow_blank: true
end
