require 'ox'
require 'color'

module Tm2Gsv
  class ThemeWriter

    def initialize(task)
      @task = task || ::Thor.new()
    end

    def write(theme, destination)
      @theme = theme
      @destination = destination
      @file = File.join(@destination, "#{@theme[:id]}.xml")

      create_doc
      create_scheme

      create_styles(@theme[:settings])
      create_styles(@theme[:styles])

      write_file

      return @file
    end

    private

      def create_doc
        @doc = ::Ox::Document.new(version: '1.0', encoding: 'UTF-8')
      end

      def create_scheme
        @scheme = ::Ox::Element.new('style-scheme')
        @scheme[:id] = @theme[:id]
        @scheme[:_name] = @theme[:name]
        @scheme[:version] = @theme[:version]
        @doc << @scheme

        author = ::Ox::Element.new('author')
        author << 'TM2GSV'
        @scheme << author

        desc = ::Ox::Element.new('description')
        desc << 'A GTKSourceView color scheme converted with TM2GSV.'
        @scheme << desc
      end

      def create_styles(styles)
        styles.each do |key, value|
          next if value.empty?

          elem = ::Ox::Element.new('style')
          elem[:name] = key
          value.each do |k, v|
            next if v.nil?
            if v.to_s.color?
              elem[k] = normalize_color(v)
            else
              elem[k] = v
            end
          end

          @scheme << elem
        end
      end

      def write_file
        ::Ox.default_options = { with_xml: true }
        ::Ox.to_file @file, @doc
      end

      def normalize_color(value)
        bg = @theme[:settings]['text']['background']

        if value.color_with_alpha?
          bg = ::Color::RGB.from_html(bg.to_hex_color)
          color = ::Color::RGB.from_html(value.to_hex_color)
          return color.mix_with(bg, value.to_hex_alpha).html
        else
          return ::Color::RGB.from_html(value).html
        end
      end

  end
end
