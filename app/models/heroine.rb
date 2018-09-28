class Heroine < ApplicationRecord
    #all speedsters have the same power etc.
    belongs_to :power

    validates :super_name, uniqueness: true
end
