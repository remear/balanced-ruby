cwd = File.dirname(File.dirname(File.absolute_path(__FILE__)))
$:.unshift(cwd + "/lib")
require 'balanced'

begin
  Balanced::Card
rescue NameError
  raise "wtf"
end

host = ENV.fetch('BALANCED_HOST') { nil }
options = {}
if host
  options[:scheme] = 'http'
  options[:host] = host
  options[:port] = 5000
end

Balanced.configure(nil, options)

Balanced.configure('33f00240f47011e2823f026ba7f8ec28')

marketplace = Balanced::Marketplace.mine

puts "create a customer"
#
customer = marketplace.create_customer(
          :name           => "Bill",
          :email          => "bill@bill.com",
          :business_name  => "Bill Inc.",
          :ssn_last4      => "1234",
          :address => {
            :line1 => "1234 1st Street",
            :city  => "San Francisco",
            :state => "CA"
        }
  ).save

puts "our customer uri is #{customer.uri}"

card = marketplace.create_card(
          :card_number       => "4111111111111111",
          :expiration_month  => "12",
          :expiration_year   => "2015",
        ).save

puts "our card uri is #{card.uri}"

puts "associate the newly created bank account and card to our customer"

customer.add_card(card)

card = Balanced::Card.find(card.uri)

hold = card.hold(
  :amount => 2000,
  :description => "Some descriptive text for the debit in the dashboard",
  :appears_on_statement_as => "Really Awesome Company"
)

puts hold.uri

puts hold.appears_on_statement_as