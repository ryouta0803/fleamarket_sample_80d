class ItemImg < ApplicationRecord
  belongs_to :item
  mount_uploader :image, ItemImgUploader
end
