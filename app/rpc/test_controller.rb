require "gruf"

require_relative "../../test_services_pb"

require_relative "../models/foo"
require_relative "../models/bar"

require_relative "../models/foo_enum"
require_relative "../models/bar_enum"

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

  def trade_foos
    bars = []
    request.message.each_with_index do |foo, i|
      Bar.new(id: (i + 1).to_s, name: foo.name).tap do |bar|
        bars << bar
      end
    end
    BarEnum.new(bars).each
  end
end
