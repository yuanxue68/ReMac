require './lib/response'
require './lib/commands/internet'
require './lib/commands/volume'
require './lib/commands/music'
require './lib/commands/screenshot'

module Command
  class CommandHandler
    attr_accessor :response
    
    def initialize(command)
      @command = command
      @response = Response.new 
    end

    def handle_command
      begin
        args = @command.split(" ")
        command = args.shift
        case command.downcase
        when "music"
          music = Music.new(args)
          music.run_command
          @response.body = music.response
        when "screenshot"
          screenshot = Screenshot.new(args)
          screenshot.run_command
          @response.body = "screenshot"
          @response.media = screenshot.response 
        when "volume"
          volume = Volume.new(args)
          volume.run_command
          @response.body = volume.response
        when "lock"
          lock = Lock.new(command_split, @response)
          lock.run_command
        when "internet"
          internet = Internet.new(args)
          internet.run_command
          @response.body = internet.response
        else
          @response.body = "unrecognized command"
        end
      rescue 
        @response.body = "an error has occured while processing command"
      end
    end
  end
end

