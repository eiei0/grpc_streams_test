require_relative "../../test_services_pb"

class FooEnum
  def initialize(foos)
    @foos = foos
  end

  def each
    return enum_for(:each) unless block_given?

    foos.each { |foo| yield Test::Foo.new(name: foo.name) }
  end

  private

  attr_reader :foos
end
