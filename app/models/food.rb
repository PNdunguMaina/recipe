class Food < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User'
  has_many :recipe_foods, dependent: :destroy
  has_many :recips, through: :recipe_foods, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, numericality: { only_integer: true }
  validates :quantity, presence: true
end
