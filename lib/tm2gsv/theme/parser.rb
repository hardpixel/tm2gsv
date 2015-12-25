require 'json'
require 'plist'

module Tm2Gsv
  class ThemeParser

    def initialize(task)
      @task = task || ::Thor.new()
    end

    def parse(file)
      @hash = ::Plist::parse_xml(file)
      @settings = @hash['settings']
      @theme = { version: '1.0' }

      # Get theme meta
      @theme[:name] = @hash['name']
      @theme[:id] = @hash['name'].dasherize
      @theme[:settings] = {}
      @theme[:styles] = {}

      parse_styles
      parse_scopes
      parse_settings

      return @theme
    end

    private

      def parse_styles
        @settings.drop(1).each do |style|
          settings = style['settings'] || {}

          settings['fontStyle'].to_s.split.each { |f| settings[f] = true }
          settings.delete('fontStyle')

          scopes = style['scope'].to_s.split(%r{,\s*})
          scopes.each do |scope|
            @theme[:styles][scope] = settings if settings.any?
          end
        end
      end

      def parse_scopes
        data = load_data('styles.json')
        styles = @theme[:styles]

        @theme[:styles] = {}
        data.each do |key, value|
          style = styles.select { |k, _v| value.include?(k) }
          @theme[:styles][key] = style.values[0] if style.any?
        end
      end

      def parse_settings
        data = load_data('settings.json')

        data.each do |name, opts|
          @theme[:settings][name] = parse_setting(opts)
        end
      end

      def parse_setting(opts)
        settings = @settings.first['settings']
        styles = @theme[:styles]
        setting = {}

        opts.each do |key, value|
          value = [value].flatten.reverse
          if key == 'fontStyle'
            style = settings.select { |k, _v| value.include?(k) }.values[0]
            style.to_s.split.each { |i| setting[i] = true }
          else
            value.each do |item|
              if item.include? '.'
                item = item.split('.')
                style = styles.select { |k, _v| k == item[0] }
                style = style[item[0]][item[1]] rescue nil
              else
                style = settings[item] rescue nil
              end
              setting[key] = style unless style.nil?
            end
          end
        end

        return setting
      end

      def load_data(file)
        path = File.join(Tm2Gsv.root, 'data', 'theme', file)
        json = File.read File.expand_path(path)
        return ::JSON.parse(json)
      end

  end
end
