class Word < ApplicationRecord
      scope :ina, ->(amount) { where("a not in (?)", amount) }
      scope :inb, ->(amount) { where("b not in (?)", amount) }
      scope :inc, ->(amount) { where("c not in (?)", amount) }
      scope :ind, ->(amount) { where("d not in (?)", amount) }
      scope :ine, ->(amount) { where("e not in (?)", amount) }


      scope :sa, ->(amount) { where("a not in (?)", amount) }   # копия 5 строк выше, хочу что бы скопы совпадали с именем поля
      scope :sb, ->(amount) { where("b not in (?)", amount) }
      scope :sc, ->(amount) { where("c not in (?)", amount) }
      scope :sd, ->(amount) { where("d not in (?)", amount) }
      scope :se, ->(amount) { where("e not in (?)", amount) }


      scope :a, ->(amount) { where("a = (?)", amount) }
      scope :b, ->(amount) { where("b = (?)", amount) }
      scope :c, ->(amount) { where("c = (?)", amount) }
      scope :d, ->(amount) { where("d = (?)", amount) }
      scope :e, ->(amount) { where("e = (?)", amount) }

      scope :anylike, ->(amount) { where("a in (?) or b in (?) or c in (?) or d in (?) or e in (?)", amount,amount,amount,amount,amount) }

      scope :likea, ->(amount) { where("word like ?", amount) }

end


