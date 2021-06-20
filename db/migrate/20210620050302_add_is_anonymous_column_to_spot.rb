class AddIsAnonymousColumnToSpot < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :is_anonymous, :boolean, :default => false
  end
end
