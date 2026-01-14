#!/usr/bin/env ruby
require 'json'

def merge_json_files(file1_path, file2_path)
    file1_content = File.read(file1_path)
    file2_content = File.read(file2_path)

    json1 = JSON.parse(file1_content)
    json2 = JSON.parse(file2_content)

    mergex_json = json2.merge(json1)

    File.write(file2_path, JSON.pretty_generate(mergex_json))
end
