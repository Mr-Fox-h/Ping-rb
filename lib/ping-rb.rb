require 'net/ping'
require 'optparse'
require 'colorize'

options = {}
OptionParser.new do |opts|

  # NOTE: Explain the Ping-rb
  opts.banner = "Explain: Send ICMP ECHO_REQUEST to network hosts\nVERSION 0.2.2\n------------------------------------------------\nAuthor: Meisam Heidari\nGithub: https://github.com/Mr-Fox-h\nGitlab: https://gitlab.com/mr-fox-h\nBitbucket: https://bitbucket.org/mr-fox-h\n------------------------------------------------\n"

  # NOTE: Ping the external IP/DNS
  opts.on('-e', '--external NAME', 'External ping') do |host_external_option|
    puts "\nPing the external IP\n----------------------------------\n"
    4.times do
      check = Net::Ping::External.new(host_external_option)
      if check.ping? == true
        puts "\aADDRESS IS " + host_external_option.to_s.colorize(:light_blue) + "| STATUS IS " + "UP".colorize(:green)
        sleep 1
      else
        puts "\aADDRESS IS " + host_external_option.to_s.colorize(:light_blue) + "| STATUS IS " + "DOWN".colorize(:red)
        sleep 1
      end
    end
  end

  # NOTE: Ping the HTTP address
  opts.on('-h', '--http NAME', 'HTTP ping') do |host_http_option|
    puts "\nPing the HTTP ADDRESS\n----------------------------------\n"
    4.times do
      check = Net::Ping::External.new(host_http_option)
      if check.ping? == true
        puts "\aADDRESS IS " + host_http_option.to_s.colorize(:light_blue) + "| STATUS IS " + "UP".colorize(:green)
        sleep 1
      else
        puts "\aADDRESS IS " + host_http_option.to_s.colorize(:light_blue) + "| STATUS IS " + "DOWN".colorize(:red)
        sleep 1
      end
    end
  end

  # NOTE: Ping the TCP ADDRESS/IP
  opts.on('-t', '--tcp NAME', 'TCP ping') do |host_tcp_option|
    puts "\nPing the TCP ADDRESS/IP\n----------------------------------\n"
    4.to_i.times do
      check = Net::Ping::External.new(host_tcp_option)
      if check.ping? == true
        puts "\aADDRESS IS " + host_tcp_option.to_s.colorize(:light_blue) + "| STATUS IS " + "UP".colorize(:green)
        sleep 1
      else
        puts "\aADDRESS IS " + host_tcp_option.to_s.colorize(:light_blue) + "| STATUS IS " + "DOWN".colorize(:red)
        sleep 1
      end
    end
  end

  # NOTE: Ping the UDP ADDRESS/IP
  opts.on('-u', '--udp NAME', 'UDP ping') do |host_udp_option|
    puts "\nPing the UDP ADDRESS/IP\n----------------------------------\n"
    4.to_i.times do
      check = Net::Ping::External.new(host_udp_option)
      if check.ping? == true
        puts "\aADDRESS IS " + host_udp_option.to_s.colorize(:light_blue) + "| STATUS IS " + "UP".colorize(:green)
        sleep 1
      else
        puts "\aADDRESS IS " + host_udp_option.to_s.colorize(:light_blue) + "| STATUS IS " + "DOWN".colorize(:red)
        sleep 1
      end
    end
  end

  # NOTE: Ping the External IP/DNS (loop mode)
  opts.on('--external-loop NAME', 'External ping (LOOP MODE)') do |host_external_loop_option|
    puts "\nPing the external IP (LOOP MODE)\n----------------------------------\n"
    loop do
      check = Net::Ping::External.new(host_external_loop_option)
      if check.ping? == true
        puts "ADDRESS IS " + host_external_loop_option.to_s.colorize(:light_blue) + "| STATUS IS " + "UP".colorize(:green)
        sleep 1
      else
        puts "ADDRESS IS " + host_external_loop_option.to_s.colorize(:light_blue) + "| STATUS IS " + "DOWN".colorize(:red)
        sleep 1
      end
    end
  end

  # NOTE: Ping the HTTP address (loop mode)
  opts.on('--http-loop NAME', 'HTTP ping (LOOP MODE)') do |host_http_loop_option|
    puts "\nPing the HTTP ADDRESS (LOOP MODE)\n----------------------------------\n"
    loop do
      check = Net::Ping::External.new(host_http_loop_option)
      if check.ping? == true
        puts "ADDRESS IS " + host_http_loop_option.to_s.colorize(:light_blue) + "| STATUS IS " + "UP".colorize(:green)
        sleep 1
      else
        puts "ADDRESS IS " + host_http_loop_option.to_s.colorize(:light_blue) + "| STATUS IS " + "DOWN".colorize(:red)
        sleep 1
      end
    end
  end

  # NOTE: Ping the TCP address/IP (loop mode)
  opts.on('--tcp-loop NAME', 'TCP ping (LOOP MODE)') do |host_tcp_loop_option|
    puts "\nPing the TCP ADDRESS/IP (LOOP MODE)\n----------------------------------\n"
    loop do
      check = Net::Ping::External.new(host_tcp_loop_option)
      if check.ping? == true
        puts "ADDRESS IS " + host_tcp_loop_option.to_s.colorize(:light_blue) + "| STATUS IS " + "UP".colorize(:green)
        sleep 1
      else
        puts "ADDRESS IS " + host_tcp_loop_option.to_s.colorize(:light_blue) + "| STATUS IS " + "DOWN".colorize(:red)
        sleep 1
      end
    end
  end

  # NOTE: Ping the UDP ADDRESS/IP (loop mode)
  opts.on('--udp-loop NAME', 'UDP ping (LOOP MODE)') do |host_udp_loop_option|
    puts "\nPing the UDP ADDRESS/IP (LOOP MODE)\n----------------------------------\n"
    loop do
      check = Net::Ping::External.new(host_udp_loop_option)
      if check.ping? == true
        puts "ADDRESS IS " + host_udp_loop_option.to_s.colorize(:light_blue) + "| STATUS IS " + "UP".colorize(:green)
        sleep 1
      else
        puts "ADDRESS IS " + host_udp_loop_option.to_s.colorize(:light_blue) + "| STATUS IS " + "DOWN".colorize(:red)
        sleep 1
      end
    end
  end

  # NOTE: Verbose command for external ping
  opts.on('--verbose-e NAME', 'Verbose output for External ping') do |host_verbose_external_option|
    check = Net::Ping::External.new(host_verbose_external_option)
    if check.ping? == true
      puts "Address: " + host_verbose_external_option.to_s.colorize(:light_blue)
      puts "Status: " + "UP".colorize(:green)
      print 'Timeout: '
      p check.timeout
      print 'Duration: '
      p check.duration
      print 'Port: '
      p check.port
      print 'warning: '
      p check.warning
      print 'Exception: '
      p check.exception
    else
      puts "Address: " + host_verbose_external_option.to_s.colorize(:light_blue)
      puts "Status: " + "DOWN".colorize(:red)
      print 'Timeout: '
      p check.timeout
      print 'Duration: '
      p check.duration
      print 'Port: '
      p check.port
      print 'warning: '
      p check.warning
      print 'Exception: '
      p check.exception
    end
  end

  # NOTE: Verbose command for HTTP ping
  opts.on('--verbose-h NAME', 'Verbose output for HTTP ping') do |host_verbose_http_option|
    check = Net::Ping::HTTP.new(host_verbose_http_option)
    if check.ping? == true
      puts "Address: " + host_verbose_http_option.to_s.colorize(:light_blue)
      puts "Status: " + "UP".colorize(:green)
      print 'Timeout: '
      p check.timeout
      print 'Duration: '
      p check.duration
      print 'Port: '
      p check.port
      print 'warning: '
      p check.warning
      print 'Exception: '
      p check.exception
    else
      puts "Address: " + host_verbose_http_option.to_s.colorize(:light_blue)
      puts "Status: " + "DOWN".colorize(:red)
      print 'Timeout: '
      p check.timeout
      print 'Duration: '
      p check.duration
      print 'Port: '
      p check.port
      print 'warning: '
      p check.warning
      print 'Exception: '
      p check.exception
    end
  end

  # NOTE: Verbose command for TCP ping
  opts.on('--verbose-t NAME', 'Verbose output for TCP ping') do |host_verbose_tcp_option|
    check = Net::Ping::TCP.new(host_verbose_tcp_option)
    if check.ping? == true
      puts "Address: " + host_verbose_tcp_option.to_s.colorize(:light_blue)
      puts "Status: " + "UP".colorize(:green)
      print 'Timeout: '
      p check.timeout
      print 'Duration: '
      p check.duration
      print 'Port: '
      p check.port
      print 'warning: '
      p check.warning
      print 'Exception: '
      p check.exception
    else
      puts "Address: " + host_verbose_tcp_option.to_s.colorize(:light_blue)
      puts "Status: " + "DOWN".colorize(:red)
      print 'Timeout: '
      p check.timeout
      print 'Duration: '
      p check.duration
      print 'Port: '
      p check.port
      print 'warning: '
      p check.warning
      print 'Exception: '
      p check.exception
    end
  end

  # NOTE: Verbose command for UDP ping
  opts.on('--verbose-u NAME', 'Verbose output for UDP ping') do |host_verbose_udp_option|
    check = Net::Ping::TCP.new(host_verbose_udp_option)
    if check.ping? == true
      puts "Address: " + host_verbose_udp_option.to_s.colorize(:light_blue)
      puts "Status: " + "UP".colorize(:green)
      print 'Timeout: '
      p check.timeout
      print 'Duration: '
      p check.duration
      print 'Port: '
      p check.port
      print 'warning: '
      p check.warning
      print 'Exception: '
      p check.exception
    else
      puts "Address: " + host_verbose_udp_option.to_s.colorize(:light_blue)
      puts "Status: " + "DOWN".colorize(:red)
      print 'Timeout: '
      p check.timeout
      print 'Duration: '
      p check.duration
      print 'Port: '
      p check.port
      print 'warning: '
      p check.warning
      print 'Exception: '
      p check.exception
    end
  end

  # NOTE: Help option
  opts.on('-a', '--aid', '--help', 'Print this help') do
    puts opts
    exit
  end
end.parse!

options
