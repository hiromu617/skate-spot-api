class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :uid, null: false
      t.boolean :limit, :default => true
      
      t.timestamps
    end
    add_index :users, :uid, unique: true
  end
end
