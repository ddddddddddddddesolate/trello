# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :card
  belongs_to :user

  validates :card, presence: true
  validates :user, presence: true
  validates :text, presence: true, length: { minimum: 1, maximum: 255 }
end
