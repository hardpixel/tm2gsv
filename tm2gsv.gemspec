# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: tm2gsv 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "tm2gsv"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jonian Guveli", "Olibia Tsati"]
  s.date = "2015-11-29"
  s.description = "Convert TextMate color scgemes to GTK Source View color schemes."
  s.email = "info@hardpixel.eu"
  s.executables = ["tm2gsv"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "CHANGELOG.md",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "bin/tm2gsv",
    "data/theme/settings.json",
    "data/theme/styles.json",
    "lib/tm2gsv.rb",
    "lib/tm2gsv/cli.rb",
    "lib/tm2gsv/extensions.rb",
    "lib/tm2gsv/language.rb",
    "lib/tm2gsv/theme.rb",
    "lib/tm2gsv/theme/parser.rb",
    "lib/tm2gsv/theme/writer.rb"
  ]
  s.homepage = "http://hardpixel.github.io/tm2gsv"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "A command-line tool for developing wordpress themes and plugins"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, ["~> 0.19"])
      s.add_runtime_dependency(%q<json>, ["~> 1.8"])
      s.add_runtime_dependency(%q<plist>, ["~> 3.1"])
      s.add_runtime_dependency(%q<ox>, ["~> 2.2"])
      s.add_runtime_dependency(%q<color>, ["~> 1.8"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0"])
    else
      s.add_dependency(%q<thor>, ["~> 0.19"])
      s.add_dependency(%q<json>, ["~> 1.8"])
      s.add_dependency(%q<plist>, ["~> 3.1"])
      s.add_dependency(%q<ox>, ["~> 2.2"])
      s.add_dependency(%q<color>, ["~> 1.8"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<thor>, ["~> 0.19"])
    s.add_dependency(%q<json>, ["~> 1.8"])
    s.add_dependency(%q<plist>, ["~> 3.1"])
    s.add_dependency(%q<ox>, ["~> 2.2"])
    s.add_dependency(%q<color>, ["~> 1.8"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0"])
  end
end

