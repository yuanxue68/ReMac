require 'twilio-ruby'
require 'sinatra'
require 'pry'
require './lib/commands/command_handler'

post '/command' do
  if params["From"] == "+16472958956"
    handler = Command::CommandHandler.new(params["Body"])
    handler.handle_command
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message handler.response.body
    end
    twiml.text
  end
end
  
