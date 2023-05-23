require_relative 'domain/channel'
require_relative 'domain/video'
require_relative 'domain/subscriber/waterball'
require_relative 'domain/subscriber/fireball'

def main
  waterball = Waterball.new("水球")
  fireball = Fireball.new("火球")
  wb_channel = Channel.new("水球學院")
  p_channel = Channel.new("PewDiePie")
  wb_channel.register(waterball)
  wb_channel.register(fireball)
  p_channel.register(waterball)
  p_channel.register(fireball)

  wb_channel.upload("C1M1S2", "這個世界正是物件導向的呢！", 240)
  p_channel.upload("Hello guys", "Clickbait", 30)
  wb_channel.upload("C1M1S3", "物件 vs. 類別", 60)
  p_channel.upload("Minecraft", "Let’s play Minecraft", 1800)
end

main
