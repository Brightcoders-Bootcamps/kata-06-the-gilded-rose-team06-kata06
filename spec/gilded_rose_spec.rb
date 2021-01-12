require File.join(File.dirname(__FILE__), '../app/gilded_rose')
require File.join(File.dirname(__FILE__), '../app/item_class')

RSpec.describe GildedRose do
  before do
    @item = Item.new("Sulfuras, Hand of Ragnaros",0,5)
    @gilded_rose = GildedRose.new(@item)
  end
  describe ".update_quality_by_type" do
    it "doesn't change quality and can't be sell" do
      expect(@gilded_rose.update_quality_by_type(@item)).to eq(false)
    end

    it "Backstage passes, increases in Quality as its SellIn value approaches" do
      @item.name = "Backstage passes to a TAFKAL80ETC concert";
      @item.sell_in = 8;
      @item.quality = 5;
      expect(@gilded_rose.update_quality_by_type(@item)).to eq(7)
    end
  
    it "Aged Brie increase the quality" do
      @item.name = "Aged Brie";
      @item.sell_in =5;
      @item.quality =7;
      expect(@gilded_rose.update_quality_by_type(@item)).to eq(8)
    end
    
    it "test another type of product" do
      @item.name = "Liquid";
      @item.sell_in = 8;
      @item.quality = 8;
      expect(@gilded_rose.update_quality_by_type(@item)).to eq(7)
    end
    
    it "Conjured, decrease quality twice" do
      @item.name = "Conjured Mana Cake";
      @item.sell_in = 8;
      @item.quality = 5;
      expect(@gilded_rose.update_quality_by_type(@item)).to eq(3)
    end

    
  end
end
