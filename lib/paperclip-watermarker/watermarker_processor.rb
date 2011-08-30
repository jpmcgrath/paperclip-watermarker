require 'paperclip-thumbnailer/processor'
require 'paperclip-thumbnailer/filters/image_magick_filter'
require 'paperclip-watermarker/watermarker_filter'

module Paperclip
  module Watermarker

    WatermarkerProcessor = Paperclip::Thumbnailer::Processor.build_from(
      [WatermarkerFilter.new, Paperclip::Thumbnailer::ImageMagickFilter.new]
    )

  end
end
