# encoding: utf-8
require 'rtesseract'
require 'mini_magick'
require 'RMagick'

=begin
#first try

img = MiniMagick::Image.new("artist.png")   
img.colorspace("GRAY")#灰度化
img.monochrome
img.negate
#img.monochrome
image = RTesseract.new(img.path)  
p image.to_s.sub(/\s+$/, "") # => "254369"   
=end 

=begin
#second try

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

#third try

img = Magick::Image.read('1.jpg').first
#img = Magick::Image.read('http://lailaihui.com/Customer/GetValidateCode?v=0.4715193349402398').first
img = img.reduce_noise(1)
img.resize!(6)
img.write('tmp.jpg')

img = MiniMagick::Image.new("tmp.jpg")
img.crop("#{img[:width] - 2}x#{img[:height] - 2}+1+1")
# img.monochrome # 去色
img.colorspace("GRAY") #灰度化
# img.monochrome #二值化
image = RTesseract.new(img.path,:lang => "eng", options: [:digits, :quiet]) #ocr识别
p image.to_s.sub(/\s+$/, "") #=> "5692"ocr识别

# delete tmp file
File.delete("tmp.jpg")
