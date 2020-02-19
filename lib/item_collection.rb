require 'csv'
require_relative 'item'

class ItemCollection
  attr_reader :items

  def initialize(csv_file_path)
    @items = create_items(csv_file_path)
  end

  def create_items(csv_file_path)
    csv = CSV.read("#{csv_file_path}", headers: true, header_converters: :symbol)

    csv.map do |row|
       Item.new(row)
    end
  end

  def find(id)
    @items.find do |item|
      item.id == id
    end
  end

  def where(merchant_id)
    @items.find_all do |item|
      item.merchant_id == merchant_id
    end
  end

  def average_item_price
    sum_prices = @items.sum do |item|
      item.unit_price
    end

    sum_prices.to_f / @items.length
  end
end
