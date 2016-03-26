require 'twilio-ruby'
require 'sinatra'
require 'pry'
require 'dotenv'
require './lib/commands/command_handler'

Dotenv.load

post '/command' do
  if params["From"] == ENV["NUMBER"]
    handler = Command::CommandHandler.new(params["Body"])
    handler.handle_command
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message handler.response.body
    end
    twiml.text
  end
end
  
