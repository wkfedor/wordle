class AddDetailsToTemporaries < ActiveRecord::Migration[7.0]
  def change
    add_column :temporaries, :sa, :text
    add_column :temporaries, :sb, :text
    add_column :temporaries, :sc, :text
    add_column :temporaries, :sd, :text
    add_column :temporaries, :se, :text
  end
end
