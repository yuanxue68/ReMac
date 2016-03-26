require './lib/response'
require './lib/commands/internet'
require './lib/commands/volume'
module Command
  class CommandHandler
    attr_accessor :response
    
    def initialize(command)
      @command = command
      @response = Response.new 
    end

    def handle_command
      begin
        command_split = @command.split(" ")
        case command_split[0].downcase
        when "music"
          music = Music.new(command_split, @response)
          music.run_command
        when "screenshot"
          screenshot = Screenshot.new(command_split, @response)
          screenshot.run_command
        when "volume"
          volume = Volume.new(command_split[1])
          volume.run_command
          @response.body = volume.response
        when "lock"
          lock = Lock.new(command_split, @response)
          lock.run_command
        when "internet"
          internet = Internet.new(command_split[1])
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

