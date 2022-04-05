class Word < ApplicationRecord
      scope :ina, ->(amount) { where("a in (?)", amount) }
      scope :inb, ->(amount) { where("b in (?)", amount) }
end
