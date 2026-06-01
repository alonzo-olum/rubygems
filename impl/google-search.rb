#!/usr/bin/ruby -w

require 'soap/wsdlDriver'

def print_page_titles(license_key, query)
  wsdl_uri = 'http://api.google.com/GoogleSearch.wsdl'
  driver = SOAP::WSDLDriverFactory.new(wsdl_uri).create_rpc_driver
  result_set = driver.doGoogleSearch(license_key, query, 0, 10, true,
                                    '', false, '', '', '')
  result_set.resultElements.each do |result|
    puts result.title
  end
end

if ARGV.size < 2
  puts "Usage: #{0} [Google license key] [query]"
  exit
end

license_key, query = ARGV
print_page_titles(license_key, query)
