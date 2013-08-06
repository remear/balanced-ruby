require 'spec_helper'

describe Balanced::Card, '#debit', vcr: true, marketplace: true do
  it 'raises an exception with an unassociated card' do
    card = Balanced::Card.new
    expect {
      card.debit
    }.to raise_error(Balanced::UnassociatedCardError)
  end
end

describe Balanced::Card, '#hold', vcr: true, marketplace: true do
  it 'raises an exception with an unassociated card' do
    card = Balanced::Card.new
    expect {
      card.hold
    }.to raise_error(Balanced::UnassociatedCardError)
  end
  
  describe 'with associated Customer' do
    before do
      api_key = Balanced::ApiKey.new.save
      Balanced.configure api_key.secret
      marketplace = Balanced::Marketplace.new.save
      
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

      @card = marketplace.create_card(
                :card_number       => "4111111111111111",
                :expiration_month  => "12",
                :expiration_year   => "2015",
      ).save
      
      customer.add_card(@card)
      @card = Balanced::Card.find(@card.uri)
    end

    it 'sets appears_on_statement_as' do
      @card.hold(
        :amount => 2000,
        :description => 'Some descriptive text for the debit in the dashboard',
        :appears_on_statement_as => 'Really Awesome Company'
      )
      subject { @card }
      its(:appears_on_statement_as) { should eq 'Really Awesome Company' }
    end
    
  end
end

describe Balanced::Card, '#debit', vcr: true, marketplace: true do
  it 'debits the card if an account is set' do
    # tokenize card
    card = Balanced::Card.new(
      card_number:      '4111111111111111',
      expiration_year:  '2016',
      expiration_month: '12')
    card.save

    # associate card to account
    Balanced::Account.new(email_address: 'user@example.com', name: 'John Doe', card_uri: card.uri).save

    card = Balanced::Card.find(card.uri)
    card.debit(amount: 10000).should be_instance_of Balanced::Debit
  end
end
