% if mode == 'definition':
Balanced::Customer.associate_to_customer

% elif mode == 'request':
require 'balanced'
Balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

card = Balanced::Card.fetch('/cards/CC68IoCVpoFlkugB7xt52p8C')
card.associate_to_customer('/customers/CU64R7DS6DwuXYVg9RTskFK8')

% elif mode == 'response':
#<Balanced::Card:0x007fa4e49f12e0
 @attributes=
  {"address"=>
    {"city"=>nil,
     "country_code"=>nil,
     "line1"=>nil,
     "line2"=>nil,
     "postal_code"=>nil,
     "state"=>nil},
   "avs_postal_match"=>nil,
   "avs_result"=>nil,
   "avs_street_match"=>nil,
   "brand"=>"MasterCard",
   "created_at"=>"2014-03-06T19:23:25.159503Z",
   "cvv"=>"xxx",
   "cvv_match"=>"yes",
   "cvv_result"=>"Match",
   "expiration_month"=>12,
   "expiration_year"=>2020,
   "fingerprint"=>
    "fc4ccd5de54f42a5e75f76fbfde60948440c7a382ee7d21b2bc509ab9cfed788",
   "href"=>"/cards/CC68IoCVpoFlkugB7xt52p8C",
   "id"=>"CC68IoCVpoFlkugB7xt52p8C",
   "is_verified"=>true,
   "links"=>{"customer"=>"CU64R7DS6DwuXYVg9RTskFK8"},
   "meta"=>{},
   "name"=>nil,
   "number"=>"xxxxxxxxxxxx5100",
   "updated_at"=>"2014-03-06T19:23:25.633918Z"},
 @hyperlinks=
  {"card_holds"=>
    #<Proc:0x007fa4e49e9810/lib/balanced/utils.rb:6 (lambda)>,
   "customer"=>
    #<Proc:0x007fa4e49e39d8/lib/balanced/resources/resource.rb:60 (lambda)>,
   "debits"=>
    #<Proc:0x007fa4e49e1ac0/lib/balanced/utils.rb:6 (lambda)>}>

% endif
