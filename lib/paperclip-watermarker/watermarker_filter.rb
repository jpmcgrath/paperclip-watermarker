module Paperclip
  module Watermarker

    class WatermarkerFilter
      def atop(filter)
        @filter = filter
        self
      end

      def filter
        @filter
      end

      def flags(options)
        filter.flags(options).with_destination("-")
      end

      def command(source, destination, options)
        filter.command(source, '-', flags(options)) +
          %{ | composite \\( "#{options[:watermark].path}" -resize 100% \\) - -dissolve 20% -gravity center -geometry +0+0 "#{destination}"}
      end
    end

  end
end
