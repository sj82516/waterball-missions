
class Video
  def initialize(title, description, length, channel)
    @title = title
    @description = description
    @length = length
    @channel = channel
  end

  attr_accessor :title, :description, :length, :channel

  def like(subscriber)
    puts "#{subscriber.name} 對影片 \"#{title}\" 按讚。"
  end
end
