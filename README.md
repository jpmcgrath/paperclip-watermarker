paperclip-watermarker
=====================

This gem provides a Paperclip processor and a paperclip-thumbnailer filter for adding watermarks to uploading images in your Rails app.

In your Gemfile:

    gem 'paperclip-watermarker'

In your ActiveModel class:

    has_attached_file :avatar,
      :styles => {
        :medium => {
          :geometry => '100x100',
          :watermark => medium_watermark },
        :large => {
          :geometry => '300x300',
          :watermark => large_watermark }},
       :processor => [:watermarker]

    has_attached_file :abs,
      :styles => {
        :medium => {
          :geometry => '100x100',
          :watermark => medium_watermark },
        :large => {
          :geometry => '300x300',
          :watermark => large_watermark }},
       :processor => [:thumbnailed_watermarker]

     def self.medium_watermark
       File.open(File.join(Rails.root, *%w(public images medium_watermark.png)))
     end

     def self.large_watermark
       File.open(File.join(Rails.root, *%w(public images large_watermark.png)))
     end

License and Copyright
---------------------

Copyright 2011 [thoughtbot](http://thoughtbot.com/). Licensed under the MIT license.

Original written by Mike Burns. For support please [open a Github Issue](https://github.com/thoughtbot/paperclip-watermarker/issues).
