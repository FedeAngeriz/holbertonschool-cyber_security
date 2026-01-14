#!/usr/bin/env ruby
require 'net/http'
require 'uri'
require 'json'

def get_request(url)
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)

    output = {
        status: response.code,
        body: response.body
    }

    puts JSON.pretty_generate(output)
end
