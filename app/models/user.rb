class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :foods, dependent: :destroy, foreign_key: 'author_id'
  has_many :recips, dependent: :destroy, foreign_key: 'author_id'

  # Validations
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :password, presence: true, length: { minimum: 8 },
                       format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)(?=.*@)[A-Za-z\d@]{8,}\z/, message: 'Must include at least one letter, one number, and one special character' }
end
