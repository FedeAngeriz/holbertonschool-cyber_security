#!/usr/bin/env ruby
require 'json'

def count_user_ids(path)
    content = File.read(path)
    data = JSON.parse(content)
    count = 0
    data.each do |item|
        count += 1 if item.key?('userId')
    end
    count
end
