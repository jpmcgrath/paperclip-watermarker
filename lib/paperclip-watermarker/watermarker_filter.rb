module Paperclip
  module Watermarker

    class WatermarkerFilter
      def atop(filter)
        @filter = filter
        self
      end

      def command(source, destination, options)
        @filter.command(source, destination, options).tap do |cmd|
          cmd.
            for_command(:composite).
            with_options(:source_file_options => %{\\( "#{options[:watermark].path}" -resize 100% \\)}).
            with_flag(:dissolve, '20%').
            with_flag(:gravity, 'center').
            with_flag(:geometry, '+0+0')
        end
      end
    end

  end
end
