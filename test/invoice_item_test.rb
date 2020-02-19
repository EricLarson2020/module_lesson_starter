require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_item'

class InvoiceItemTest < Minitest::Test
  def setup
    @invoice_item = InvoiceItem.new({
      :id          => 1,
      :item_id     => 2,
      :invoice_id  => 3,
      :quantity    => 4,
      :unit_price  => 1099,
    })
  end

  def test_it_exists
    assert_instance_of InvoiceItem, @invoice_item
  end

  def test_it_has_attributes
    assert_equal 1, @invoice_item.id
    assert_equal 2, @invoice_item.item_id
    assert_equal 3, @invoice_item.invoice_id
    assert_equal 1099, @invoice_item.unit_price
    assert_equal 4, @invoice_item.quantity
  end
end
