require 'net/ping'
require 'optparse'
require 'colorize'

options = {}
OptionParser.new do |opts|
  # NOTE: Explain the Ping-rb
  opts.banner = "Explain: Send ICMP ECHO_REQUEST to network hosts\n------------------------------------------------\nAuthor: Meisam Heidari\nGithub: https://github.com/Mr-Fox-h\nGitlab: https://gitlab.com/mr-fox-h\nBitbucket: https://bitbucket.org/mr-fox-h\n------------------------------------------------\n"
  # NOTE: Ping the external IP (FOR 10 TIME)
  opts.on('-e', '--external NAME', 'External ping') do |host_external_option|
    puts "\nPing the external IP (FOR 10 TIME)\n----------------------------------\n"
    puts "IP\t\t\t   statuse\n----------------|-----------------"
    10.times do
      check = Net::Ping::External.new(host_external_option)
      if check.ping? == true
        puts host_external_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
      else
        puts host_external_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
      end
    end
  end
  # NOTE: Ping the external IP (YOU CAN PING FOR EVER)
  opts.on('-E', '--external-loop NAME', 'External ping (LOOP)') do |host_external_loop_option|
    puts "\nPing the external IP (LOOP)\n----------------------------------\n"
    puts "IP\t\t\t   statuse\n----------------|-----------------"
    loop do
      check = Net::Ping::External.new(host_external_loop_option)
      if check.ping? == true
        puts host_external_loop_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
      else
        puts host_external_loop_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
      end
    end
  end
  # NOTE: Ping the HTTP ADDRESS (FOR 10 TIMES)
  opts.on('-h', '--http NAME', 'HTTP ping (FOR 10 TIMES)') do |host_http_option|
    puts "\nPing the HTTP ADDRESS (FOR 10 TIME)\n----------------------------------\n"
    puts "Address\t\t\t   statuse\n----------------|-----------------"
    10.times do
      check = Net::Ping::HTTP.new(host_http_option)
      if check.ping? == true
        puts host_http_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
      else
        puts host_http_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
      end
    end
  end
  # NOTE: Ping the HTTP ADDRESS (LOOP)
  opts.on('-H', '--http-loop NAME', 'HTTP ping (LOOP)') do |host_http_loop_option|
    puts "\nPing the HTTP ADDRESS (LOOP)\n----------------------------------\n"
    puts "Address\t\t\t   statuse\n----------------|-----------------"
    loop do
      check = Net::Ping::HTTP.new(host_http_loop_option)
      if check.ping? == true
        puts host_http_loop_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
      else
        puts host_http_loop_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
      end
    end
  end
  # NOTE: Ping the TCP ADDRESS/IP (FOR 10 TIMES)
  opts.on('-t', '--tcp NAME', 'TCP ping (FOR 10 TIMES)') do |host_tcp_option|
    puts "\nPing the  ADDRESS/IP (FOR 10 TIMES)\n----------------------------------\n"
    puts "Address/IP\t\t   statuse\n----------------|-----------------"
    10.times do
      check = Net::Ping::TCP.new(host_tcp_option)
      if check.ping? == true
        puts host_tcp_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
      else
        puts host_tcp_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
      end
    end
  end
  # NOTE: Ping the TCP ADDRESS/IP (LOOP)
  opts.on('-T', '--tcp-loop NAME', 'TCP ping (LOOP)') do |_host_tcp_Loop_option|
    puts "\nPing the  ADDRESS/IP (LOOP)\n----------------------------------\n"
    puts "Address/IP\t\t   statuse\n----------------|-----------------"
    loop do
      check = Net::Ping::TCP.new(host_tcp_loop_option)
      if check.ping? == true
        puts host_tcp_loop_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
      else
        puts host_tcp_loop_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
      end
    end
  end
  # NOTE: Ping the UDP ADDRESS/IP (FOR 10 TIMES)
  opts.on('-u', '--udp NAME', 'TCP ping (FOR 10 TIMES)') do |host_udp_option|
    puts "\nPing the  ADDRESS/IP (FOR 10 TIMES)\n----------------------------------\n"
    puts "Address/IP\t\t   statuse\n----------------|-----------------"
    10.times do
      check = Net::Ping::UDP.new(host_udp_option)
      if check.ping? == true
        puts host_udp_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
      else
        puts host_udp_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
      end
    end
  end
  # NOTE: Ping the UDP ADDRESS/IP (LOOP)
  opts.on('-u', '--udp NAME', 'TCP ping (LOOP)') do |host_udp_loop_option|
    puts "\nPing the  ADDRESS/IP (LOOP)\n----------------------------------\n"
    puts "Address/IP\t\t   statuse\n----------------|-----------------"
    loop do
      check = Net::Ping::UDP.new(host_udp_option)
      if check.ping? == true
        puts host_udp_loop_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
      else
        puts host_udp_loop_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
      end
    end
  end
  # NOTE: Verbose command for external ping
  opts.on('--verbose-e NAME', 'Verbose output for External ping') do |host_verbose_external_option|
    5.times do
      check = Net::Ping::External.new(host_verbose_external_option)
      if check.ping? == true
        puts host_verbose_external_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
        print 'Timeout:'
        p check.timeout
        print 'Duration:'
        p check.duration
        print 'Port:'
        p check.port
        print 'warning: '
        p check.warning
        print 'Exception: '
        p check.exception
        puts '-------------------------------------------------------------------------------------------'
      else
        puts host_verbose_external_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
        print 'Timeout:'
        p check.timeout
        print 'Duration:'
        p check.duration
        print 'Port:'
        p check.port
        print 'warning: '
        p check.warning
        print 'Exception: '
        p check.exception
        puts '-------------------------------------------------------------------------------------------'
      end
    end
  end
  # NOTE: Verbose command for HTTP ping
  opts.on('--verbose-h NAME', 'Verbose output for HTTP ping') do |host_verbose_http_option|
    5.times do
      check = Net::Ping::HTTP.new(host_verbose_http_option)
      if check.ping? == true
        puts host_verbose_http_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
        print 'Timeout:'
        p check.timeout
        print 'Duration:'
        p check.duration
        print 'Port:'
        p check.port
        print 'warning: '
        p check.warning
        print 'Exception: '
        p check.exception
        puts '-------------------------------------------------------------------------------------------'
      else
        puts host_verbose_http_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
        print 'Timeout:'
        p check.timeout
        print 'Duration:'
        p check.duration
        print 'Port:'
        p check.port
        print 'warning: '
        p check.warning
        print 'Exception: '
        p check.exception
        puts '-------------------------------------------------------------------------------------------'
      end
    end
  end
  # NOTE: Verbose command for TCP ping
  opts.on('--verbose-t NAME', 'Verbose output for TCP ping') do |host_verbose_tcp_option|
    5.times do
      check = Net::Ping::TCP.new(host_verbose_tcp_option)
      if check.ping? == true
        puts host_verbose_tcp_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
        print 'Timeout:'
        p check.timeout
        print 'Duration:'
        p check.duration
        print 'Port:'
        p check.port
        print 'warning: '
        p check.warning
        print 'Exception: '
        p check.exception
        puts '-------------------------------------------------------------------------------------------'
      else
        puts host_verbose_tcp_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
        print 'Timeout:'
        p check.timeout
        print 'Duration:'
        p check.duration
        print 'Port:'
        p check.port
        print 'warning: '
        p check.warning
        print 'Exception: '
        p check.exception
        puts '-------------------------------------------------------------------------------------------'
      end
    end
  end
  # NOTE: Verbose command for UDP ping
  opts.on('--verbose-u NAME', 'Verbose output for UDP ping') do |host_verbose_udp_option|
    5.times do
      check = Net::Ping::TCP.new(host_verbose_udp_option)
      if check.ping? == true
        puts host_verbose_udp_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
        print 'Timeout:'
        p check.timeout
        print 'Duration:'
        p check.duration
        print 'Port:'
        p check.port
        print 'warning: '
        p check.warning
        print 'Exception: '
        p check.exception
        puts '-------------------------------------------------------------------------------------------'
      else
        puts host_verbose_udp_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
        print 'Timeout:'
        p check.timeout
        print 'Duration:'
        p check.duration
        print 'Port:'
        p check.port
        print 'warning: '
        p check.warning
        print 'Exception: '
        p check.exception
        puts '-------------------------------------------------------------------------------------------'
      end
    end
  end
  # NOTE: Help option
  opts.on('-a', '--aid', '--help', 'Print this help') do
    puts opts
    exit
  end
end.parse!

options
