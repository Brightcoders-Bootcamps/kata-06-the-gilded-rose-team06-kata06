# frozen_string_literal: true

#
#   Class used to control the updating of quality of a item
#   GildedRose
require_relative 'item_class'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      update_quality_by_type(item)
    end
  end

  def update_quality_by_type(item)
    name = item.name
    return false if name == 'Sulfuras, Hand of Ragnaros'

    case name
    when 'Backstage passes to a TAFKAL80ETC concert'
      update_quality_backstage(item)
    when 'Aged Brie'
      update_quality_aged_brie(item)
    when 'Conjured Mana Cake'
      update_quality_conjured(item)
    else
      update_quality_common(item)
    end
  end

  def update_quality_backstage(item)
    new_quality = 0
    item_quality = item.quality
    if expired?(item.sell_in) == false
      new_quality = item_quality + 2 if item.sell_in <= 10
      new_quality += 1 if item.sell_in <= 5
    end
    update_quality_and_sell(new_quality, item)
  end

  def expired?(sell_in)
    sell_in.zero? ? true : false
  end

  def update_quality_aged_brie(item)
    new_quality = item.quality + 1
    update_quality_and_sell(new_quality, item)
  end

  def quality_valid?(quality)
    quality >= 0 && quality <= 50 ? true : false
  end

  def update_quality_common(item)
    new_quality = item.quality - 1
    update_quality_and_sell(new_quality, item)
  end

  def update_quality_conjured(item)
    new_quality = item.quality - 2
    update_quality_and_sell(new_quality, item)
  end

  def update_quality_and_sell(new_quality, item)
    new_quality = 0 if new_quality.negative?
    new_quality = 50 if new_quality > 50
    item.sell_in -= 1
    item.quality = new_quality
  end
end
