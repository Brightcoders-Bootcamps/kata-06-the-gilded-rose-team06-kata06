require File.join(File.dirname(__FILE__), '../app/gilded_rose')
require File.join(File.dirname(__FILE__), '../app/item_class')

describe GildedRose do

  before do
    @Item = Item.new("Sulfuras, Hand of Ragnaros",0,5)
    @GildedRose = GildedRose.new(@Item)
  end
  describe ".update_quality_by_type" do
    it "doesn't change quality and can't be sell" do
      expect(@GildedRose.update_quality_by_type(@Item)).to eq(false)
    end
  end

end
