require 'spec_helper'
require 'paperclip-watermarker/watermarker_filter'

describe WatermarkerFilter do
  let(:options) { {:a => 1} }
  let(:file) { 'file' }

  subject { WatermarkerFilter.new.tap {|wf| wf.atop(MockBaseFilter.new) } }

  it_behaves_like "a combinable ImageMagick filter"

  it "adds stdout as the flag destination" do
    subject.flags(options).should have_destination_flag("-")
  end

  it "pipes the filter's command to the `composite' command" do
    subject.command(file, options).should match(%r{#{Regexp.escape('| composite \( %s -resize 100% \) - -dissolve 20% -gravity center -geometry +0+0')}$})
  end
end
