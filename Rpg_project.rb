require 'chingu'
class Rpggame < Chingu::Window
  def initialize
    super
    $window.caption = 'RPG test'
    @background = Gosu::Image['Starting_area backround.png']
    Player.create.input = {holding_a: :move_left, holding_d: :move_right, holding_w: :move_up, holding_s: :move_down}
    Boat_door.create
    Goblin_enemy.create
    $images =  ["Charecter back step 1 crop.png", "Charecter back step 2 crop.png", "Charecter left step 1 crop.png", "Charecter left step 2 crop.png", "Charecter right step 1 crop.png", "Charecter right step 2 crop.png", "Charecter step 1 crop.png", "Charecter step 2 crop.png" ]
    $images2 = ["Goblin step 1 crop.png", "Goblin step 2 crop.png", "Goblin  right step 1 crop.png", "Goblin right step 2 crop.png", "Goblin left step 1 crop.png", "Goblin left step 2 crop.png", "Goblin back step 1 crop.png", "Goblin back step 2 crop.png"]
    $moving_left = false
    $frame_rate = 0



  end



  def draw
    super
    @background.draw(0,0,0,1.5,1.5)

  end
end
class Player < Chingu::GameObject
  attr_accessor :image
  def initialize
    super
    @image = Gosu::Image['Charecter crop.png']
    @x = 400
    @y = 500
    @factor_x = 0.4
    @factor_y = 0.4
  end


  def move_left
    if $window.button_down?(Gosu::KbW) or $window.button_down?(Gosu::KbS)
      @x -= Math::sin(Math::PI/4) * 4
      else
        @x = @x - 4
      end

    if $frame_rate% 20 < 10

      @image = Gosu::Image["#{$images[2]}"]
    else
      @image = Gosu::Image["#{$images[3]}"]
    end
    $frame_rate += 1

  end
  def move_right
    if $window.button_down?(Gosu::KbW) or $window.button_down?(Gosu::KbS)
      @x += Math::sin(Math::PI/4) * 4
    else
      @x = @x + 4
    end


    if $frame_rate% 20 < 10

      @image = Gosu::Image["#{$images[4]}"]
    else
      @image = Gosu::Image["#{$images[5]}"]
    end
    $frame_rate += 1
  end


  def move_up
    @y = @y - 4
    if $frame_rate% 20 < 10

      @image = Gosu::Image["#{$images[1]}"]
    else
      @image = Gosu::Image["#{$images[0]}"]
    end
    $frame_rate += 1
  end
  def move_down
    @y = @y + 4
    if $frame_rate% 20 < 10

      @image = Gosu::Image["#{$images[6]}"]
    else
      @image = Gosu::Image["#{$images[7]}"]
    end
    $frame_rate += 1
  end
end
class Boat_door < Chingu::GameObject
  traits :collision_detection, :bounding_circle
  def initialize
    super(:image => Gosu::Image['Boat_Door crop.png'])
    @factor_x = 1.5
    @factor_y = 1.5
    @x = 405
    @y = 193
  end


end
class Goblin_enemy < Chingu::GameObject
  traits :collision_detection, :bounding_circle

  def initialize
    super(:image => Gosu::Image['Goblin crop.png'])
    @factor_x = 0.5
    @factor_y = 0.5
    @x = 450
    @y = 500
    @up=0
    @down=0
    @left=0
    @right=0



  end
  def update
    @up = 0
    if rand(0..20) == 1
      while @up < 10
        @y = @y - 4
        @up = @up +1
      end
      if $frame_rate% 20 < 10

        @image = Gosu::Image["#{$images2[6]}"]
      else
        @image = Gosu::Image["#{$images2[7]}"]
      end


    end

  @down = 0
  if rand(0..20) == 2
    while @down < 10
      @y = @y + 4
      @down = @down +1
    end

  end
  if $frame_rate % 20 < 10

    @image = Gosu::Image["#{$images2[0]}"]
  else
    @image = Gosu::Image["#{$images2[1]}"]
  end
  @left = 0
  if rand(0..20) == 3
    while @left < 10
      @x = @x - 4
      @left = @left +1
    end

  end
  if $frame_rate % 20 < 10

    @image = Gosu::Image["#{$images2[2]}"]
  else
    @image = Gosu::Image["#{$images2[3]}"]
  end
  @right = 0
  if rand(0..20) == 4
    while @right < 10
      @x = @x + 4
      @right = @right +1
    end

  end
  if $frame_rate % 20 < 10

    @image = Gosu::Image["#{$images2[4]}"]
  else
    @image = Gosu::Image["#{$images2[5]}"]
  end
  end
  end



Rpggame.new.show