require_relative "../../test_services_pb"

class BarEnum
  def initialize(bars)
    @bars = bars
  end

  def each
    return enum_for(:each) unless block_given?

    bars.each { |bar| yield Test::Bar.new(id: bar.id, name: bar.name) }
  end

  private

  attr_reader :bars
end
