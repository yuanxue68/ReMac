class Volume
  def initialize(args)
    @level = args.first
  end

  def run_command
    @result = system("osascript -e '#{change_volume}'")
    puts ("osascript -e '#{change_volume}'")
  end

  def response
    if @result
      "Volume changed to '#{@level}'"
    else
      "Unable to change volume to '#{@level}'"
    end
  end

  def media?
    false
  end

  private

  def change_volume
    "set volume output volume \"#{@level}\""
  end
end

