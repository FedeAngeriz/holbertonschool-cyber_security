#!/usr/bin/env ruby
require 'optparse'

TASK_FILE = 'tasks.txt'

options = {}

OptionParser.new do |opts|
    opts.banner = "Usage: cli.rb [options]"
    
    opts.on('-a TASK', '--add TASK', 'Add a new task') do |task|
        options[:add] = task
    end

    opts.on('-l', '--list', 'List all tasks') do
        options[:list] = true
    end

    opts.on('-r INDEX', '--remove INDEX', Integer, 'Remove a task by index') do |index|
        options[:remove] = index
    end
    
    opts.on('.h', '--help', 'Show help') do
        puts opts
        exit
    end
end.parse!

File.write(TASK_FILE, '') unless File.exist?(TASK_FILE)

if options[:add]
    File.open(TASK_FILE, 'a') do |file|
        file.puts options[:add]
    end
    puts "Task '#{options[:add]}' added."
elsif options[:list]
  tasks = File.readlines(TASK_FILE)
  tasks.each { |task| puts task.chomp }
elsif options[:remove]
  tasks = File.readlines(TASK_FILE)
  index = options[:remove] - 1

  if index >= 0 && index < tasks.length
    removed_task = tasks.delete_at(index)
    File.open(TASK_FILE, 'w') { |file| file.write(tasks.join) }
    puts "Task '#{removed_task.chomp}' removed."
  end
end