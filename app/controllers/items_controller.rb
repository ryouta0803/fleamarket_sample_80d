class ItemsController < ApplicationController
  # before_action :set_item, only: [:show]

  def index
    @items = Item.all
  end

  def new
  end

  def create
  end

  def show
    # @comment = Comment.new 準備のみ
    # @comments = @item.comments.includes(:user) 準備のみ
  end

  def edit
  end

  def update
  end

  def destory
  end

  private

  def set_item
    # @item = item.find(params[:id])
  end
end
