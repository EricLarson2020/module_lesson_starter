require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_item_collection'
require 'pry'

class InvoiceItemCollectionTest < Minitest::Test
  def setup
    @invoice_item_collection = InvoiceItemCollection.new("./test/fixtures/invoice_items_truncated.csv")
    @invoice_item = @invoice_item_collection.invoice_items[2]
  end

  def test_it_exists
    assert_instance_of InvoiceItemCollection, @invoice_item_collection
  end

  def test_it_has_attributes
    assert_instance_of Array, @invoice_item_collection.invoice_items
    assert_equal 10, @invoice_item_collection.invoice_items.length
  end

  def test_it_can_create_items_from_csv
    assert_instance_of InvoiceItem, @invoice_item
    assert_equal 3, @invoice_item.id
    assert_equal "263451719", @invoice_item.item_id
    assert_equal "1", @invoice_item.invoice_id
    assert_equal 34873, @invoice_item.unit_price
    assert_equal 8, @invoice_item.quantity
  end

  def test_it_can_calculate_average_unit_price
    assert_equal 38078.8, @invoice_item_collection.average_unit_price
  end

  def test_it_can_calculate_average_quantity
    assert_equal 5.7, @invoice_item_collection.average_quantity
  end
end
