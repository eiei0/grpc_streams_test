require 'gruf'

require_relative '../test_services_pb.rb'

client = Gruf::Client.new(service: Test::Test, options: { hostname: '0.0.0.0:9001' })
client.call(:ListFoos, {}).tap do |resp|
  resp.message.each { |foo| puts foo.name }
end
