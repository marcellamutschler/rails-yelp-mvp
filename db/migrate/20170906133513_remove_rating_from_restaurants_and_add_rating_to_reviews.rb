class RemoveRatingFromRestaurantsAndAddRatingToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :rating, :integer
    remove_column :restaurants, :rating, :integer
  end
end
