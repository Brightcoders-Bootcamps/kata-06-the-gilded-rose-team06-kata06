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
    
  end
end
