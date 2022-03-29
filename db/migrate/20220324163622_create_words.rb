class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.string :word
      t.integer :anynum
      t.bigint :codeword
      t.string :a
      t.string :b
      t.string :c
      t.string :d
      t.string :e

      t.timestamps
    end
  end
end
