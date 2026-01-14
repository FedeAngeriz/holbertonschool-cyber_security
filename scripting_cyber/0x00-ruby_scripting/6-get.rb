#!/usr/bin/env ruby
require 'net/http'
require 'json'

def get_request(url)
    uri = URI(url)
    response = Net::HTTP.get_response(uri)

    status_code = response.code
    status_message = response.message

    responde_body = JSON.parse(response.body)

    puts "Response status: #{status_code} #{status_message}"
    puts "Response body:"
    puts JSON.pretty_generate(responde_body)
end
