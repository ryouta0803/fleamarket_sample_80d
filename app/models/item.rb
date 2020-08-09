class Item < ApplicationRecord

  validates :name, presence:true, length:{maximum:40}
  validates :explain, presence:true, length:{maximum:1000}
  validates :price, presence:true, numericality: {greater_than_or_equal_to: 300}
  validates :category, presence:true
  validates :status, presence:true
  validates :postage, presence:true
  validates :prefecture, presence:true
  validates :shipping_date, presence:true

  enum status: {
    新品、未使用:"新品、未使用",
    目立った傷や汚れなし:"目立った傷や汚れなし",
    目立った傷や汚れあり:"目立った傷や汚れあり",
    全体的に状態が悪い:"全体的に状態が悪い"
  }
  enum postage: {
    送料込み（出品者負担）:"送料込み（出品者負担）",
    着払い（購入者負担）:"着払い（購入者負担）"
  }

  enum shipping_date: {
    "1~2日で発送":"1~2日で発送",
    "2~3日で発送":"2~3日で発送", 
    "4~7日で発送":"4~7日で発送"
  }

  # コメント、お気に入り機能を実装したらコメントアウト外す。
  # has_many :comments, dependent: :destroy
  # has_many :likes, dependent: :destroy
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User",optional:true
  belongs_to :category
  belongs_to :user, foreign_key: 'user_id',optional:true 
  has_many :item_imgs, inverse_of: :item,dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :item_imgs, allow_destroy: true
end
