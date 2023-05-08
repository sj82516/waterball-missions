require_relative './domain/world'
require_relative './domain/collision_handler/fire_fire_collision_handler'
require_relative './domain/collision_handler/water_fire_collision_handler'
require_relative './domain/collision_handler/water_water_collision_handler'
require_relative './domain/collision_handler/hero_fire_collision_handler'
require_relative './domain/collision_handler/hero_water_collision_handler'
require_relative './domain/collision_handler/hero_hero_collision_handler'

def main
  world = World.new
  world.set_collision_handler_chain(
    FireFireCollisionHandler.new(world,
        WaterFireCollisionHandler.new(world,
          WaterWaterCollisionHandler.new(world,
            HeroFireCollisionHandler.new(world,
              HeroWaterCollisionHandler.new(world,
                HeroHeroCollisionHandler.new(world)))))))

  world.init

  while true
    world.log
    puts "move coord"
    coord1 = gets.chomp.to_i
    coord2 = gets.chomp.to_i
    world.move(coord1, coord2)
  end
end

main
