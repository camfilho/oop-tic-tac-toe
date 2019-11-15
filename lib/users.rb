# frozen_string_literal: true

class Users
  attr_reader :type
  attr_accessor :name
  def initialize(name, type)
    @name = name
    @type = type
  end
end
