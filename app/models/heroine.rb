class Heroine < ApplicationRecord
  belongs_to :power
  validates :super_name, uniqueness: true

  def self.search_by_power(search_power)
    only_this_power = []
    self.all.each do |heroine|
      byebug
      if heroine.power.name == search_by_power
        only_this_power << heroine
      end
    end
    only_this_power
  end


end
