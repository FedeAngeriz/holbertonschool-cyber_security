#!/usr/bin/env ruby

require 'digest'

def dictionary_attack(hashed_password, dictionary_file)
    File.foreach(dictionary_file) do |word|
        word = word.chomp
        hashed_word = Digest::SHA256.hexdigest(word)

        if hashed_word == hashed_password
            puts "Password found: #{word}"
            return
        end
    end

    puts "Password not found in dictionary."
end

if ARGV.length != 2
    puts "Usage: 10-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE"
    exit 1
end

hashed_password = ARGV[0]
dictionary_file = ARGV[1]

dictionary_attack(hashed_password, dictionary_file)
