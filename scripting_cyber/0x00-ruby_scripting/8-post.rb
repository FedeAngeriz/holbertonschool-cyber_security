#!/usr/bin/env ruby
require 'net/http'
require 'uri'

def post_request(url, body_params)
    uri = URI(url)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == "https")

    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data(body_params) unless body_params.empty?

    response = http.request(request)

    puts response.body
end
