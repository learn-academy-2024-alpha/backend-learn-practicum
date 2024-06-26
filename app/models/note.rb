class Note < ApplicationRecord
  has_many :user_notes
  has_many :users, through: :user_notes
  validates :title, :content, :creator, presence: true
  validates :creator, numericality: {only_integer: true}
  validates :public, inclusion: {in: [true, false]}
  accepts_nested_attributes_for :user_notes
end
