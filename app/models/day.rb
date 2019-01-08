class Day < ApplicationRecord
  validates_presence_of :summary,
                        :temp_low,
                       :temp_high

  has_many :hours
end
