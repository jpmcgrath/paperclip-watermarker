require 'paperclip-watermarker/watermarker_filter'
require 'paperclip-thumbnailer/processor'
require 'paperclip-thumbnailer/filters/thumbnailer_filter'
require 'paperclip-thumbnailer/filters/filter_terminus'
require 'paperclip-thumbnailer/commands/command_center'
require 'paperclip-thumbnailer/commands/convert_command'
require 'paperclip-thumbnailer/commands/composite_command'
require 'paperclip'

module PaperclipWatermarker
  ::Paperclip.configure do |c|
    c.register_processor :watermarker, ::PaperclipThumbnailer::Processor.build_from(
      [WatermarkerFilter.new,
       ::PaperclipThumbnailer::FilterTerminus.new(
         ::PaperclipThumbnailer::CompositeCommand.new)])
    c.register_processor :thumbnailed_watermarker,
      ::PaperclipThumbnailer::Processor.build_from(
        [::PaperclipThumbnailer::ThumbnailerFilter.new,
         WatermarkerFilter.new,
         ::PaperclipThumbnailer::FilterTerminus.new(
           ::PaperclipThumbnailer::CommandCenter.new(
             [::PaperclipThumbnailer::ConvertCommand.new,
              ::PaperclipThumbnailer::CompositeCommand.new]))])
  end
end
