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
      r.Message do |message|
        message.Body handler.response.body if handler.response.body
        message.Media handler.response.media if handler.response.media
      end
    end
    twiml.text
  end
end
  
