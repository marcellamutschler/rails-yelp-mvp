class RemoveCategoriesFromRestaurants < ActiveRecord::Migration[5.0]
  def change
    remove_column :restaurants, :categories, :string
    add_column :restaurants, :category, :string
  end
end
