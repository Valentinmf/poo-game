require 'pry'

class Player
		attr_accessor :name, :life_points
	
		def	initialize(name)
		@name = name
    @life_points = 10
    end

    def show_state
      puts "#{name} has #{life_points} hp"
    end
    
    def gets_damage (amout)
      @life_points -= amout
      if @life_points <= 0
        puts "Player #{name} has been killed !"
      end
    end

    def attacks (player2)
      puts "Player #{@name} attacks player #{player2.name}"
      domg = compute_damage
      puts "He deals #{domg} damage points"
      player2.gets_damage(domg)
    end

    def compute_damage
      return rand(1..6)
    end
end
class HumanPlayer < Player

  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@life_points} and a #{weapon_level} weapon level"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_1v1 = rand(1..6)
    puts "You found a lvl #{new_weapon_1v1} weapon"
    if new_weapon_1v1 > @weapon_level then
      @weapon_level = new_weapon_1v1
      puts "Yeah ! This weapon is better than your current weapon : you have "+"#{@weapon_level}" + "weapon"
    else
      puts "Your current weapon is too stronger ! too bad"
    end
  end

  def search_health_pack
    tmp = 0
    health_pack = rand(1..6)
    if health_pack == 1 then
      puts "No health pack found"
    elsif health_pack < 6 then
      tmp = 50
      @life_points = life_points + 50
      if life_points > 100 then
        tmp = 50 - (life_points - 100)
        @life_points = 100
      end
      puts "Yeah, you found a +"+"50"+" health pack ! You gained +"+"#{tmp}"+" HP"
    else
      @life_points = life_points + 80
      tmp = 80
      if life_points > 100 then
        tmp = 80 - (life_points - 100)
        @life_points = 100
      end
      puts "Yeah, you found a +"+"80"+" health pack ! You gained +"+"#{tmp}"+" HP"
    end
  end
  

end
puts "end of file"