require_relative './base'

class Car < Base
  attr_accessor :registration_number, :color

  def initialize(registration_number, color)
    raise ArgumentError unless registration_number.is_a?(String) || color.is_a?(String)
    @registration_number = registration_number.downcase
    @color = color.downcase
  end

end