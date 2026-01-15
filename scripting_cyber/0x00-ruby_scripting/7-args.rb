#!/usr/bin/env ruby
def print_arguments
    if ARGV.empty?
        puts "No arguments"
    else
        puts "Arguments:#{ARGV.join}"
    end
end

print_arguments
