require 'gruf'

require_relative 'test_services_pb.rb'

# Creates a new Enumerable wrapper around the client
# streaming request object
class CreateFoosEnum
  def initialize(names)
    @names = names
  end

  def each
    return enum_for(:each) unless block_given?

    names.each { |n| yield Test::CreateFoosRequest.new(name: n) }
  end

  private

  attr_reader :names
end

names = 20_000.times.map { |i| "foo_#{i + 1}" }
enum = CreateFoosEnum.new(names)
client = Gruf::Client.new(service: Test::Test, options: { hostname: '0.0.0.0:9001' })
client.call(:CreateFoos, enum.each)
