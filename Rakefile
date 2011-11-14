begin
  require 'echoe'
rescue LoadError
  abort "You'll need to have `echoe' installed to use capistrano-ext-rvm-bundler's Rakefile"
end

require "./lib/capistrano/ext/version"

version = Capistrano::Ext::RvmBundler::Version::STRING.dup
if ENV['SNAPSHOT'].to_i == 1
  version << "." << Time.now.utc.strftime("%Y%m%d%H%M%S")
end

Echoe.new('capistrano-ext-rvm-bundler', version) do |p|
  p.changelog        = "CHANGELOG.rdoc"

  p.author           = "Marcin Nowicki"
  p.email            = "pr0d1r2@gmail.com"
  p.summary          = "Capistrano recipes to support RVM installations with bundler"
  p.url              = "https://github.com/doubledrones/capistrano-ext-rvm-bundler"

  p.need_zip         = true

  p.dependencies     = ["capistrano >=1.0.0", "capistrano-ext-rvm >=0.0.1"]
end
