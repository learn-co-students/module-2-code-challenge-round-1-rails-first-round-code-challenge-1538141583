class Heroine < ApplicationRecord
  validates :name, uniqueness: true
  validates :power_id, inclusion: {in: %w(1 2 3 4)}
  belongs_to :power
end
