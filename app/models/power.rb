class Power < ApplicationRecord
  has_many :heroines
  validates :name, presence: true
end
