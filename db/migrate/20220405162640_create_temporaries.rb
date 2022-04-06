class CreateTemporaries < ActiveRecord::Migration[7.0]
  def change
    create_table :temporaries do |t|
      t.string :anylike
      t.string :dontlike
      t.string :a
      t.string :b
      t.string :c
      t.string :d
      t.string :e

      t.timestamps
    end
  end
end
