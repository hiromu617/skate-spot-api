class AddColumnToSpot < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :score, :float, :default => 0
  end
end
