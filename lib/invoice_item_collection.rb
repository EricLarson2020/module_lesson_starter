require 'csv'
require_relative 'invoice_item'

class InvoiceItemCollection
  attr_reader :invoice_items

  def initialize(csv_file_path)
    @invoice_items = create_invoice_items(csv_file_path)
  end

  def create_invoice_items(csv_file_path)
    csv = CSV.read("#{csv_file_path}", headers: true, header_converters: :symbol)

    csv.map do |row|
       InvoiceItem.new(row)
    end
  end

  def average_unit_price
    total_price = @invoice_items.sum do |invoice_item|
      invoice_item.unit_price
    end

    total_price.to_f / @invoice_items.length
  end

  def average_quantity
    total_quantity = @invoice_items.sum do |invoice_item|
      invoice_item.quantity
    end

    total_quantity.to_f / @invoice_items.length
  end
end
