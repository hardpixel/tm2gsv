module Tm2Gsv
  class Language

    def initialize(task)
      @task = task || ::Thor.new()
    end

    def convert(source, destination)
      @source = source
      @destination = destination || default_path
    end

    private

      def default_path
        File.join(ENV['HOME'], '.local', 'share', 'gtksourceview-3.0', 'language-specs')
      end

  end
end
