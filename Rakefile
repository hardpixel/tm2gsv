# encoding: utf-8

require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "tm2gsv"
  gem.executables = ["tm2gsv"]
  gem.homepage = "http://hardpixel.github.io/tm2gsv"
  gem.license = "MIT"
  gem.summary = %Q{A command-line tool for developing wordpress themes and plugins}
  gem.description = %Q{Convert TextMate color scgemes to GTK Source View color schemes.}
  gem.email = "info@hardpixel.eu"
  gem.authors = ["Jonian Guveli", "Olibia Tsati"]
  # dependencies defined in Gemfile
  gem.files.include Dir.glob('**/*')
end

Jeweler::RubygemsDotOrgTasks.new

require 'rdoc/task'

Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "tm2gsv #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('LICENSE*')
  rdoc.rdoc_files.include('CHANGELOG*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
