require 'airbrake'

Airbrake.configure do |config|
  config.api_key = ENV["AIRBRAKE_API_KEY"]  
end

unless Padrino.env == :production
  module Airbrake
    def self.notify(*args)
      hash = args.extract_options!
      puts hash[:error_message] if Padrino.env == :development or Padrino.env == :test
    end  
    
    class Sender    
      def send_to_airbrake(data)     
        # Do nothing
      end
    end
  end            
end