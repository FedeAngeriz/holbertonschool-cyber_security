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
