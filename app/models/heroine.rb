class Heroine < ApplicationRecord
  belongs_to :power

  validates :super_name, uniqueness: true

  def self.filter_by_power(filter)
    self.all.select do |heroine|
      heroine.power.name == filter
    end
  end
end
