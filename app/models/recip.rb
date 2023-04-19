class Recip < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true, length: { minimum: 10, message: 'Length too short' }
  validates :public, inclusion: { in: [true, false] }

  def calculate_total_price(recipe)
    total_price = 0
    recipe.recipe_foods.each do |recipe_food|
      food = Food.find(recipe_food.food_id)
      total_price += food.price * recipe_food.quantity.to_i
    end
    total_price
  end
end
