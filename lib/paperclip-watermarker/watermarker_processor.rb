require 'paperclip-thumbnailer/processor'
require 'paperclip-thumbnailer/filters/command_filter_terminus'
require 'paperclip-thumbnailer/commands/command_center'
require 'paperclip-thumbnailer/commands/convert_command'
require 'paperclip-thumbnailer/commands/composite_command'
require 'paperclip-watermarker/watermarker_filter'

module Paperclip
  module Watermarker

    Watermark = Paperclip::Thumbnailer::Processor.build_from(
      [WatermarkerFilter.new,
       Paperclip::Thumbnailer::CommandFilterTerminus.new(
         Paperclip::Thumbnailer::CommandCenter.new(
           [Paperclip::Thumbnailer::ConvertCommand.new,
            Paperclip::Thumbnailer::CompositeCommand.new]))])

  end
end
