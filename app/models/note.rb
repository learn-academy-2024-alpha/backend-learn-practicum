class Note < ApplicationRecord
  has_many :user_notes
  has_many :users, through: :user_notes
  accepts_nested_attributes_for :user_notes
end
