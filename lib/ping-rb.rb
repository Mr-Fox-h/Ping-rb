require 'net/ping'
require 'optparse'
require 'colorize'

options = {}
OptionParser.new do |opts|
  # NOTE: Explain the Ping-rb
  opts.banner = "Explain: Send ICMP ECHO_REQUEST to network hosts\n------------------------------------------------\nAuthor: Meisam Heidari\nGithub: https://github.com/Mr-Fox-h\nGitlab: https://gitlab.com/mr-fox-h\nBitbucket: https://bitbucket.org/mr-fox-h\n------------------------------------------------\n"
  # NOTE: Ping the external IP/DNS
  opts.on('-e', '--external NAME', 'External ping') do |host_external_option|
    puts "\nPing the external IP\n----------------------------------\n"
    print 'Count: '
    count = gets.chomp.to_s
    puts "IP\t\t\t   statuse\n----------------|-----------------"
    if %w[l L loop Loop LOOP].include?(count)
      loop do
        check = Net::Ping::External.new(host_external_option)
        if check.ping? == true
          puts host_external_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
        else
          puts host_external_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
        end
      end
    else
      count.to_i.times do
        check = Net::Ping::External.new(host_external_option)
        if check.ping? == true
          puts host_external_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
        else
          puts host_external_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
        end
      end
    end
  end
  # NOTE: Ping the HTTP address
  opts.on('-h', '--http NAME', 'HTTP ping') do |host_http_option|
    puts "\nPing the HTTP ADDRESS\n----------------------------------\n"
    print 'Count: '
    count = gets.chomp.to_s
    puts "Address\t\t\t   statuse\n----------------|-----------------"
    if %w[l L loop Loop LOOP].include?(count)
      loop do
        check = Net::Ping::External.new(host_http_option)
        if check.ping? == true
          puts host_http_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
        else
          puts host_http_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
        end
      end
    else
      count.to_i.times do
        check = Net::Ping::External.new(host_http_option)
        if check.ping? == true
          puts host_http_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
        else
          puts host_http_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
        end
      end
    end
  end
  # NOTE: Ping the TCP ADDRESS/IP
  opts.on('-t', '--tcp NAME', 'TCP ping') do |host_tcp_option|
    puts "\nPing the  ADDRESS/IP\n----------------------------------\n"
    print 'Count: '
    count = gets.chomp.to_s
    puts "Address/IP\t\t   statuse\n----------------|-----------------"
    if %w[l L loop Loop LOOP].include?(count)
      loop do
        check = Net::Ping::External.new(host_tcp_option)
        if check.ping? == true
          puts host_tcp_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
        else
          puts host_tcp_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
        end
      end
    else
      count.to_i.times do
        check = Net::Ping::External.new(host_tcp_option)
        if check.ping? == true
          puts host_tcp_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
        else
          puts host_tcp_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
        end
      end
    end
  end
  # NOTE: Ping the UDP ADDRESS/IP
  opts.on('-u', '--udp NAME', 'UDP ping') do |host_udp_option|
    puts "\nPing the  ADDRESS/IP\n----------------------------------\n"
    print 'Count: '
    count = gets.chomp.to_s
    puts "Address/IP\t\t   statuse\n----------------|-----------------"
    if %w[l L loop Loop LOOP].include?(count)
      loop do
        check = Net::Ping::External.new(host_udp_option)
        if check.ping? == true
          puts host_udp_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
        else
          puts host_udp_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
        end
      end
    else
      count.to_i.times do
        check = Net::Ping::External.new(host_udp_option)
        if check.ping? == true
          puts host_udp_option.to_s.colorize(:light_blue) + "\t\t\tUP".colorize(:green)
        else
          puts host_udp_option.to_s.colorize(:light_blue) + "\t\t\tDOWN".colorize(:red)
        end
      end
    end
  end

  # NOTE: Verbose command for external ping
  opts.on('--verbose-e NAME', 'Verbose output for External ping') do |host_verbose_external_option|
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
    end
  end
  # NOTE: Verbose command for HTTP ping
  opts.on('--verbose-h NAME', 'Verbose output for HTTP ping') do |host_verbose_http_option|
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
    end
  end
  # NOTE: Verbose command for TCP ping
  opts.on('--verbose-t NAME', 'Verbose output for TCP ping') do |host_verbose_tcp_option|
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
    end
  end
  # NOTE: Verbose command for UDP ping
  opts.on('--verbose-u NAME', 'Verbose output for UDP ping') do |host_verbose_udp_option|
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
    end
  end
  # NOTE: Help option
  opts.on('-a', '--aid', '--help', 'Print this help') do
    puts opts
    exit
  end
end.parse!

options
