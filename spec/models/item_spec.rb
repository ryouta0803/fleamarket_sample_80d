require 'rails_helper'
describe Item do
  describe '#create' do

    it "name(商品名)がない場合は登録出来ない事" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "explain(商品の説明)がない場合は登録出来ない事" do
      item = build(:item, explain: nil)
      item.valid?
      expect(item.errors[:explain]).to include("を入力してください")
    end

    it "category_id(カテゴリーの選択)がない場合は登録出来ない事" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("を入力してください")
    end

    it "status(商品の状態)の選択がない場合は登録出来ない事" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end

    it "postage(配送料の負担)の選択がない場合は登録出来ない事" do
      item = build(:item, postage: nil)
      item.valid?
      expect(item.errors[:postage]).to include("を入力してください")
    end

    it "prefecture(配送元の地域)の選択がない場合は登録出来ない事" do
      item = build(:item, prefecture: nil)
      item.valid?
      expect(item.errors[:prefecture]).to include("を入力してください")
    end

    it "shipping_date(発送までの日数)の選択がない場合は登録出来ない事" do
      item = build(:item, shipping_date: nil)
      item.valid?
      expect(item.errors[:shipping_date]).to include("を入力してください")
    end

    it "price(販売価格)の入力がない場合は登録出来ない事" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
  end
end