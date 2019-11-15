# frozen_string_literal: true

class Users
  attr_reader :type, :name
  attr_writer :name
  def initialize(name, type)
    @name = name
    @type = type
  end
end
