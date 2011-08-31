require 'spec_helper'
require 'paperclip-watermarker/watermarker_filter'

describe PaperclipWatermarker::WatermarkerFilter do
  let(:watermark_file) { File.open('/etc/passwd') }
  let(:options) { {:watermark => watermark_file} }
  subject { PaperclipWatermarker::WatermarkerFilter.new }

  it_behaves_like "a combinable filter"
end

describe PaperclipWatermarker::WatermarkerFilter do
  let(:watermark_file) { File.open('/etc/passwd') }
  let(:options) { {:watermark => watermark_file} }
  let(:file) { 'file' }
  let(:filter) do
    PaperclipWatermarker::WatermarkerFilter.new.tap do |wf|
      wf.atop(PaperclipThumbnailer::MockFilter.new)
    end
  end

  subject { filter.command(file, file, options) }

  it "pipes the filter's command to the `composite' command" do
    subject.should have_configuration(:source_file_options, %{\\( "#{watermark_file.path}" -resize 100% \\)})
    subject.should have_flag(:dissolve).set_to('20%').for_command(:composite)
    subject.should have_flag(:gravity).set_to('center').for_command(:composite)
    subject.should have_flag(:geometry).set_to('+0+0').for_command(:composite)
  end
end
