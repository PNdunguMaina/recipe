class RecipeFood < ApplicationRecord
    belongs_to :recip
    belongs_to :food
end
