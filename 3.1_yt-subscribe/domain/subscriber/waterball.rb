require_relative 'base'

class Waterball < Subscriber
  def notify(video)
    video.like(self) if video.length >= 180
  end
end
