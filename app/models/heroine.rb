class Heroine < ApplicationRecord
  belongs_to :power
  validates :super_name, uniqueness: true

  def self.find_by_power(power_id)
    if power_id.empty?
      Heroine.all
    else
      Heroine.select{|heroine| heroine.power_id == power_id.to_i}
    end
  end

  def power_name
    power.name.titleize
  end

  def power_description

    power.description.slice(0,1).capitalize + power.description.slice(1..-1)

  end

end
