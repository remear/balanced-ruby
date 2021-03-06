% if mode == 'definition':
Balanced::Debit.fetch

% elif mode == 'request':
require 'balanced'
Balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

debit = Balanced::Debit.fetch('/debits/WD5PTwr2bwJLIyJio1pEpYBr')

% elif mode == 'response':
#<Balanced::Debit:0x007fa4e4a580d0
 @attributes=
  {"amount"=>5000,
   "appears_on_statement_as"=>"BAL*Statement text",
   "created_at"=>"2014-03-06T19:23:01.594300Z",
   "currency"=>"USD",
   "description"=>"Some descriptive text for the debit in the dashboard",
   "failure_reason"=>nil,
   "failure_reason_code"=>nil,
   "href"=>"/debits/WD5PTwr2bwJLIyJio1pEpYBr",
   "id"=>"WD5PTwr2bwJLIyJio1pEpYBr",
   "links"=>
    {"customer"=>nil,
     "dispute"=>nil,
     "order"=>nil,
     "source"=>"CC5Buki6e4Kg4bDVZ3OSfQ8O"},
   "meta"=>{},
   "status"=>"succeeded",
   "transaction_number"=>"W986-715-3969",
   "updated_at"=>"2014-03-06T19:23:02.987552Z"},
 @hyperlinks=
  {"customer"=>
    #<Proc:0x007fa4e4a5b780/lib/balanced/utils.rb:6 (lambda)>,
   "dispute"=>
    #<Proc:0x007fa4e4a5ab28/lib/balanced/utils.rb:6 (lambda)>,
   "events"=>
    #<Proc:0x007fa4e4a58288/lib/balanced/utils.rb:6 (lambda)>,
   "order"=>
    #<Proc:0x007fa4e4a53c38/lib/balanced/utils.rb:6 (lambda)>,
   "refunds"=>
    #<Proc:0x007fa4e4a51460/lib/balanced/utils.rb:6 (lambda)>,
   "source"=>
    #<Proc:0x007fa4e4a4a660/lib/balanced/resources/resource.rb:60 (lambda)>}>

% endif
