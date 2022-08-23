puts "Modules and classes"

module InvoiceCreator
  DISCOUNT = 0.5
  # what is the use case for module methods ?
  def self.generate 
    puts "I am responisble for generating the invoice"
  end 

  def invoice_total
    1900
  end
end

InvoiceCreator.generate()

class Invoice
  include InvoiceCreator
  def calculate_tax
    tax = invoice_total + InvoiceCreator::DISCOUNT
    puts "You will pay #{tax} dollars in tax"
  end
end

Invoice.new.calculate_tax

class MerchantInvoice
  extend InvoiceCreator
end

puts "#{MerchantInvoice.invoice_total}"