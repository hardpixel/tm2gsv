require 'tm2gsv/theme/parser'
require 'tm2gsv/theme/writer'

module Tm2Gsv
  class Theme

    def initialize(task)
      @task = task || ::Thor.new()
    end

    def convert(source, destination)
      @themes = []
      @source = source
      @destination = destination || default_path
      @parser = Tm2Gsv::ThemeParser.new(@task)
      @writer = Tm2Gsv::ThemeWriter.new(@task)

      parse_files
      write_files
    end

    private

      def default_path
        File.join(ENV['HOME'], '.local', 'share', 'gtksourceview-3.0', 'styles')
      end

      def parse_files
        unless File.exist? @source
          @task.say "Error: No such file or directory!", :red
          exit(1)
        end

        @task.say "Searching for theme file(s).", :cyan
        if File.directory? @source
          Dir[File.join(@source, '**', '*.tmTheme')].each do |file|
            theme = @parser.parse(file) rescue next
            @themes << theme unless theme[:id].nil?
          end
        else
          theme = @parser.parse(@source) rescue return
          @themes << theme unless theme[:id].nil?
        end
        @task.say "Total found: #{@themes.count}", :green
      end

      def write_files
        @task.say "Converting theme file(s).", :cyan
        @themes.each do |theme|
          @writer.write(theme, @destination) rescue next
        end
        @task.say "Total converted: #{@themes.count}", :green
      end

  end
end
