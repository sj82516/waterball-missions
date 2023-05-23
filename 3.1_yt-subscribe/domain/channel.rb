require_relative 'video'

class Channel
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def upload(title, description, length)
    video = Video.new(title, description, length, self)
    puts "頻道 #{name} 上架了一部新影片 \"#{title}\"。"
    @subscribers.each do |subscriber|
      subscriber.notify(video)
    end
  end

  def register(subscriber)
    @subscribers ||= []
    @subscribers << subscriber
    puts "#{subscriber.name} 訂閱了 #{name}。"
  end

  def unregister(subscriber)
    @subscribers.delete(subscriber)
    puts "#{subscriber.name} 解除訂閱了 #{name}。"
  end
end
