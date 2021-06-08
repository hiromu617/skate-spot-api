class AddUserRefToSpots < ActiveRecord::Migration[6.0]
  def change
    add_reference :spots, :user, null: false, foreign_key: true
    add_column :spots, :description, :text
  end
end
