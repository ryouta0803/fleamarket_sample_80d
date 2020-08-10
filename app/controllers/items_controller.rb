class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @images = @item.item_imgs.build
    # @category = Category.where(ancestry: "").limit(13)
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    @brand = Brand.new(brand_params)
    if @item.save
      redirect_to root_path
    else
      @item.item_imgs.build
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destory
  end

  private

  def item_params
    params.require(:item).permit(
    :name, :explain, :price, :status, 
    :postage, :prefecture,
    :shipping_date, :category_id, 
    item_imgs_attributes: [:url, :_destroy, :id])
  end

  def  brand_params
    params.require(:brand).permit(:name)
  end
end
