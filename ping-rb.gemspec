Gem::Specification.new do |s|
  s.name        = 'ping-rb'
  s.executables = ['ping-rb']
  s.version     = '0.2.1'
  s.executables = 'ping-rb'
  s.summary     = 'Ping with Ruby!'
  s.description = "It's a simple CLI tool, but it is a useful tool to ping computers and systems."
  s.author      = 'Meisam Heidari'
  s.email       = 'mr.fox@iran.ir'
  s.files       = ['lib/ping-rb.rb']
  s.homepage    = 'https://github.com/Mr-Fox-h/Ping-rb'
  s.add_runtime_dependency 'net-ping', '~> 2.0', '>= 2.0.8'
  s.add_runtime_dependency 'optparse', '~> 0.2.0'
  s.add_runtime_dependency 'colorize', '~> 0.8.1'

  s.license = 'MIT'

  s.required_ruby_version     = '>= 2.7.0'
  s.required_rubygems_version = '>= 1.8.11'
end
