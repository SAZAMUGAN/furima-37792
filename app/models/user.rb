class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  hasmany :items
  has_many :purchase_records

  validates :nickname, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }

  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }

  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }

  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }

  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }

  validates :date_of_birth, presence: true
end
