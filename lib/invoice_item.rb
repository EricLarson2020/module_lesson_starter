class InvoiceItem
  attr_reader :id, :invoice_id, :item_id, :unit_price, :quantity

  def initialize(item_info)
    @item_id = item_info[:item_id]
    @id = item_info[:id].to_i
    @invoice_id = item_info[:invoice_id]
    @unit_price = item_info[:unit_price].to_i
    @quantity = item_info[:quantity].to_i
  end
end
