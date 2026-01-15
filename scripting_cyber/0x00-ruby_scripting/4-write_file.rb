#!/usr/bin/env ruby
require 'json'

def merge_json_files(file1_path, file2_path)
    json1 = JSON.parse(File.read(file1_path))
    json2 = JSON.parse(File.read(file2_path))
    
    merged = json2 + json1

    File.write(file2_path, JSON.pretty_generate(merged))

    puts "Merged JSON written to #{file2_path}"
end
