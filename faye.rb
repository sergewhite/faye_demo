#!/usr/env ruby

BASE_DIR = File.expand_path("../", __FILE__)

if ARGV[1]
  PID="#{BASE_DIR}/pids/#{ARGV[1].match(/(\w+)(.ru)/)[1]}.pid"
  COMMAND="bundle exec rackup -s thin -E production #{BASE_DIR}/#{ARGV[1]}"

  case ARGV[0]
  when "start"
    puts ">>Starting"
    pid = fork do
      Dir.chdir(BASE_DIR)
      exec *COMMAND.split(' ') # fails for quoted args, obviously
    end
    Process.detach(pid)
    File.open(PID, "w+") do |f|
      f.write(pid)
    end
  when "stop"
    puts ">>Stoping"
    begin
      Process.kill "KILL", File.read(PID).to_i
      File.delete(PID)
    rescue
    end
  else 
    puts "usage: #{$0} {start|stop} {config_name}"
  end

else
  puts "lose config name!!!"
end