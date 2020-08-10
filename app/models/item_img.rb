class ItemImg < ApplicationRecord
  belongs_to :item
  mount_uploader :image, ItemImgUploader
  validates :image, presence: true
end
