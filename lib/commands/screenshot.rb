class Screenshot
  attr_accessor :file_name
  def initialize(args)
    if args && args[0]
      @file_name = args[0]
    else
      @file_name = "screenshot.png"
    end
  end

  def run_command
    puts ("#{take_screenshot}")
    @result = system("#{take_screenshot}")
  end

  def response
    ENV["HOST"]+"/images/"+@file_name
  end

  def media?
    true
  end

  private

  def take_screenshot
    "screencapture ./public/images/#{@file_name}"
  end
end

