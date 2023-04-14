class Recip < ApplicationRecord
    # Associations
    belongs_to :author, class_name: 'User'
    has_many :recipe_foods, dependent: :destroy
    has_many :foods, through: :recipe_foods, dependent: :destroy

    # Validations
    validates :name, presence: true
    validates :preparation_time, presence: true
    validates :cooking_time, presence: true
    validates :description, presence: true, length: { minimum: 10, message: "Length too short" }
    validates :public, inclusion: { in: [true,false] }
end
