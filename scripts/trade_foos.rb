require 'gruf'

require_relative '../test_services_pb.rb'

# Creates a new Enumerable wrapper around the client
# streaming request object
class TradeFoosEnum
  def initialize(names)
    @names = names
  end

  def each
    return enum_for(:each) unless block_given?

    names.each { |n| yield Test::Foo.new(name: n) }
  end

  private

  attr_reader :names
end

names = 20_000.times.map { |i| "foo_#{i + 1}" }
enum = TradeFoosEnum.new(names)

client = Gruf::Client.new(service: Test::Test, options: { hostname: '0.0.0.0:9001' })
client.call(:TradeFoos, enum.each).tap do |resp|
  resp.message.each_slice(1000) do |foos|
    foos.each { |foo| puts foo.name }
  end
end
