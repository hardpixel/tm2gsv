require 'tm2gsv/theme'
require 'tm2gsv/language'

module Tm2Gsv
  class CLI < Thor

    # Convert theme definitions
    desc 'theme SOURCE DESTINATION', 'Convert TextMate theme(s) to GTK Source View color scheme(s)'
    long_desc 'Converts a single file or all files in a folder'
    def theme(source, destination=nil)
      converter = Tm2Gsv::Theme.new(self)
      converter.convert(source, destination)
    end

    # Convert language definitions
    desc 'language SOURCE DESTINATION', 'Convert TextMate language(s) to GTK Source View language(s)'
    long_desc 'Converts a single file or all files in a folder'
    def language(source, destination=nil)
      Tm2Gsv::Language.new(self, source, destination)
    end

  end
end
