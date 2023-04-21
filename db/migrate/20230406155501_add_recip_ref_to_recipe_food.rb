class AddRecipRefToRecipeFood < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipe_foods, :recip, null: false, foreign_key: true
  end
end
