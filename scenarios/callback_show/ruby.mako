% if mode == 'definition':
Balanced::Callback.fetch

% elif mode == 'request':
require 'balanced'
Balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

callback = Balanced::Callback.fetch('/callbacks/CB5pnz4XnaDpRFGlNMb6u50R')
% elif mode == 'response':
#<Balanced::Callback:0x007fa4e3255f78
 @attributes=
  {"href"=>"/callbacks/CB5pnz4XnaDpRFGlNMb6u50R",
   "id"=>"CB5pnz4XnaDpRFGlNMb6u50R",
   "links"=>{},
   "method"=>"post",
   "revision"=>"1.1",
   "url"=>"http://www.example.com/callback"},
 @hyperlinks={}>

% endif
