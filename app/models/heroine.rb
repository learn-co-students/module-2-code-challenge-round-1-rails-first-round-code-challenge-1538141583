class Heroine < ApplicationRecord
  belongs_to :power
  validates :super_name, uniqueness: true


  def self.search(search)
  Heroine.where(:power => search)
  end

end
