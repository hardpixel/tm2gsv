require 'thor'
require 'tm2gsv/cli'
require 'tm2gsv/extensions'

module Tm2Gsv
  def self.root
    ::File.expand_path(::File.join(::File.dirname(__FILE__), '..'))
  end
end

trap 'SIGINT' do
  puts
  puts
  puts ::Time.now.strftime('%T') + ' - INFO - Bye bye...'
  exit 130
end
