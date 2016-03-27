require 'mini_magick'

class Screenshot
  attr_accessor :file_name
  def initialize(args)
    @file_path = "./public/images/"
    @file_name = "screenshot.png"
  end

  def run_command
    puts ("#{take_screenshot}")
    @result = system("#{take_screenshot}")
    resize_image 
  end

  def response
    ENV["HOST"]+"/images/" + @file_name
  end

  def media?
    true
  end

  private

  def take_screenshot
    "screencapture #{@file_path + @file_name}"
  end

  def resize_image
    image = MiniMagick::Image.open(@file_path + @file_name)
    image.resize "800x600"
    image.write(@file_path + @file_name)
  end
end

