class RecipeFood < ApplicationRecord
  # Associations
  belongs_to :recip
  belongs_to :food

  # Validations
  validates :quantity, presence: true
end
