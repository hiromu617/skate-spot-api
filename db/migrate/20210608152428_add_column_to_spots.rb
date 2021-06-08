class AddColumnToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :prefectures, :string, null: false
    add_column :spots, :lat, :float, null: false
    add_column :spots, :lng, :float, null: false
  end
end
