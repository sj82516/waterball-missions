require_relative 'base'

class Fireball < Subscriber
  def notify(video)
    video.channel.unregister(self) if video.length <= 60
  end
end
