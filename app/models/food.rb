class Food < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :recipe_foods, dependent: :destroy, foreign_key: true
end
