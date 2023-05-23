# frozen_string_literal: true

class Subscriber
  def initialize(name)
    @name = name
  end

  attr_reader :name

  def notify(video)
    raise NotImplementedError
  end
end
