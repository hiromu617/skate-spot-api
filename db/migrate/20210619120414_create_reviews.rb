class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :spot, null: false, foreign_key: true
      t.float :rating, null:false 

      t.timestamps
    end

    add_index :reviews, [:user_id, :spot_id], :unique =>  true
  end
end
