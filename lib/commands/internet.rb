class Internet
  def initialize(args)
    @url = args.first
  end

  def run_command
    @result = system("osascript -e '#{open_url}'")
    puts ("osascript -e '#{open_url}'")
  end

  def response
    if @result
      "opened webpage '#{@url}'"
    else
      "webpage '#{@url}' was not opened"
    end
  end

  def media?
    false
  end

  private

  def open_url
    "tell application \"Safari\" to open location \"#{@url}\""
  end
end

