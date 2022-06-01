class AddDetailsToWord < ActiveRecord::Migration[7.0]
  def change
    add_column :words, :lettersumweight, :integer
  end
end
