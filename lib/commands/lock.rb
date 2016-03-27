class Lock
  def initialize(args=nil)
  end

  def run_command
    @result = system("#{lock_screen}")
  end

  def response
    if @result
      "Your mac has been locked"
    else
      "Unable to lock your mac"
    end
  end

  def media?
    false
  end

  private

  def lock_screen
    "/System/Library/CoreServices/Menu\\ Extras/User.menu/Contents/Resources/CGSession -suspend"
  end
end
