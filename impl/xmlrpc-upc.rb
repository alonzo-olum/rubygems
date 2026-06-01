#!/usr/bin/ruby -w
# xmlrpc-upc.rb

require 'xmlrpc/client'

def find_product(upc)
  server = XMLRPC::Client.new2('http://www.upcdatabase.com/rpc')
  begin
    response = server.call('lookupUPC', upc)
  rescue XMLRPC::FaultException => e
    puts "Error"
    puts e.faultCode
    puts e.faultString
  end
end

puts find_product("0014410000055")['description']



