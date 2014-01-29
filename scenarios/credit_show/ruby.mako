% if mode == 'definition':
Balanced::Credit.fetch

% elif mode == 'request':
require 'balanced'
Balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

credit = Balanced::Credit.fetch('/credits/CR2UtQgq6L3FPd1YoOc8eyOC')
% elif mode == 'response':
#<Balanced::Credit:0x007fdc9e80f7f0
 @attributes=
  {"amount"=>5000,
   "appears_on_statement_as"=>"example.com",
   "created_at"=>"2014-01-27T22:57:19.073817Z",
   "currency"=>"USD",
   "description"=>nil,
   "failure_reason"=>nil,
   "failure_reason_code"=>nil,
   "href"=>"/credits/CR2UtQgq6L3FPd1YoOc8eyOC",
   "id"=>"CR2UtQgq6L3FPd1YoOc8eyOC",
   "links"=>
    {"customer"=>"CU2N5goX8AQJE0CCPeapHUsM",
     "destination"=>"BA2QAksIxlLt60lqKc1wwgJy",
     "order"=>nil},
   "meta"=>{},
   "status"=>"succeeded",
   "transaction_number"=>"CR408-633-3169",
   "updated_at"=>"2014-01-27T22:57:20.208794Z"},
 @hyperlinks=
  {"customer"=>
    #<Proc:0x007fdc9e80d9f0/lib/balanced/resources/resource.rb:60 (lambda)>,
   "destination"=>
    #<Proc:0x007fdc9e80c078/lib/balanced/resources/resource.rb:60 (lambda)>,
   "events"=>
    #<Proc:0x007fdc9e816190/lib/balanced/utils.rb:6 (lambda)>,
   "order"=>
    #<Proc:0x007fdc9e815790/lib/balanced/utils.rb:6 (lambda)>,
   "reversals"=>
    #<Proc:0x007fdc9e81f8a8/lib/balanced/utils.rb:6 (lambda)>}>

% endif
