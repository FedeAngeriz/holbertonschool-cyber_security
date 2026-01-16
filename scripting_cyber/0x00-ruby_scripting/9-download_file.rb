#!/usr/bin/env ruby
require 'open-uri'
require 'uri'
require 'fileutils'

def download_file(url, path)
    uri = URI.parse(url)
    directory = File.dirname(path)
    FileUtils.mkdir_p(directory) unless Dir.exist?(directory)

    URI.open(uri) do |remote_file|
        File.open(path, 'wb') do |local_file|
            local_file.write(remote_file.read)
        end
    end
end

if ARGV.length != 2
    puts "9-download_file.rb URL LOCAL_FILE_PATH <URL> <PATH>"
    exit 1
end

url = ARGV[0]
path = ARGV[1]

download_file(url, path)
