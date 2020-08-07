class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :last_name, :postal_code, :first_name_kana, :last_name_kana, :postal_code, :prefecture, :city, :address, presence: true
  validates :first_name, :last_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_kana, :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
end
