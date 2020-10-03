require "gruf"

require_relative "../../test_services_pb"
require_relative "../models/foo"
require_relative "../models/foo_enum"

class TestController < ::Gruf::Controllers::Base
  bind Test::Test::Service

  def create_foos
    request.message.call { |req| puts req.name }

    Test::EmptyResp.new
  end

  def list_foos
    foos = 20_000.times.map { |i| Foo.new(name: "foo_#{i + 1}") }
    FooEnum.new(foos).each
  end
end
