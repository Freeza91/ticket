require 'rubygems'
require 'rtesseract'
require 'mini_magick'
require 'RMagick'
include Magick

img = MiniMagick::Image.new("artist.png")   
img.colorspace("GRAY")#灰度化
img.monochrome
img.negate
#img.monochrome
image = RTesseract.new(img.path)  
p image.to_s.sub(/\s+$/, "") # => "254369"   

=begin
require 'tesseract'

e = Tesseract::Engine.new {|e|
  e.language  = :eng
  e.blacklist = '|'
	e.whitelist = '0123456789'
}

thumb = Magick::Image.read("yanzhengma8.jpg").first
thumb.format = "PNG"
thumb.write("artist.png")
thumb.crop_resized!(120, 120, Magick::CenterGravity)

p e.text_for('artist.png').strip # => 'ABC'
=end
