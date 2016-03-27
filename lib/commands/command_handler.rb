require './lib/response'
require './lib/commands/internet'
require './lib/commands/volume'
require './lib/commands/music'
require './lib/commands/screenshot'
require './lib/commands/lock'

module Command
  class CommandHandler
    attr_accessor :response
    
    def initialize(text)
      @text = text
      @response = Response.new 
      @commands = ["music", "screenshot", "volume", "lock", "internet"]
    end

    def handle_command
      begin
        args = @text.split(" ")
        command = args.shift
        if @commands.include?(command.downcase)
          instance = Object.const_get(command.downcase.capitalize).new(args)
          instance.run_command
          if instance.media?
            @response.media = instance.response
          else
            @response.body = instance.response
          end
        else
          @response.body = "Unrecognized command"
        end
      rescue Exception => e
        binding.pry
        @response.body = "an error has occured while processing command"
      end
    end
  end
end

