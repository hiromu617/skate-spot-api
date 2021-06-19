class AddContentToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :content, :string, :null => false
  end
end
