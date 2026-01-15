#!/usr/bin/env ruby
require 'json'

def count_user_ids(path)
    data = JSON.parse(File.read(path))
    counts = {}

    data.each do |item|
        user_id = item['userId']
        if user_id
            counts[user_id] ||= 0
            counts[user_id] += 1
        end
    end

    counts.each do |user_id, count|
        puts "User #{user_id}: #{count}"
    end
end
