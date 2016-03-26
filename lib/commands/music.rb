class Music
  def initialize(args)
    @command = args[0].downcase
    @track = args[1]
  end

  def run_command
    case @command
    when "next"
      @result = system("osascript -e '#{next_track}'")
    when "prev"
      @result = system("osascript -e '#{prev_track}'")
    when "pause"
      @result = system("osascript -e '#{pause}'")
    when "launch"
      @result = system("osascript -e '#{lauch_player}'")
    when "play" 
      @result = system("osascript -e '#{play_music}'")
    else 
      @result = false
    end
  end

  def response
    return "Unable to manipulate iTunes on #{@command} command" unless @result
    case @command
    when "next", "prev", "play"
      "Now playing #{`osascript -e 'tell application \"iTunes\" to get name of the current track'`}"
    when "pause"
      "iTunes is now on pause"
    when "launch"
      "iTunes is now lauched"
    end
  end

  def media?
    false
  end

  private
  def next_track
    "tell application \"iTunes\" to play next track"
  end

  def prev_track
    "tell application \"iTunes\" to play previous track"
  end

  def pause
    "tell application \"iTunes\" to pause"
  end

  def play_music
    cmd = "tell application \"iTunes\" to play"
    cmd = cmd + " track \"#{@track}\"" if @track
    cmd
  end

  def lauch_player
    "tell application \"iTunes\" to launch"    
  end

end

