class Word < ApplicationRecord
      scope :ina, ->(amount) { where("a not in (?)", amount) }
      scope :inb, ->(amount) { where("b not in (?)", amount) }
      scope :inc, ->(amount) { where("c not in (?)", amount) }
      scope :ind, ->(amount) { where("d not in (?)", amount) }
      scope :ine, ->(amount) { where("e not in (?)", amount) }

      scope :a, ->(amount) { where("a = (?)", amount) }
      scope :b, ->(amount) { where("b = (?)", amount) }
      scope :c, ->(amount) { where("c = (?)", amount) }
      scope :d, ->(amount) { where("d = (?)", amount) }
      scope :e, ->(amount) { where("e = (?)", amount) }

end
