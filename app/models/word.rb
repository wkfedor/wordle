class Word < ApplicationRecord
      scope :ina, ->(amount) { where("a in (?)", amount) }
end
