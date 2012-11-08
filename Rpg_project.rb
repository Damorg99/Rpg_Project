require 'chingu'
class Rpggame < Chingu::Window
  def initialize
    super
    $window.caption = 'RPG test'
    @background = Gosu::Image['Starting_area backround.png']
    Player.create.input = {holding_a: :move_left, holding_d: :move_right, holding_w: :move_up, holding_s: :move_down}
    Boat_door.create
    Goblin_enemy.create
    $images = ["Charecter back step 1 crop.png", "Charecter back step 2 crop.png", "Charecter left step 1 crop.png", "Charecter left step 2 crop.png", "Charecter right step 1 crop.png", "Charecter right step 2 crop.png", "Charecter step 1 crop.png", "Charecter step 2 crop.png"]
    $images2 = ["Goblin step 1 crop.png", "Goblin step 2 crop.png", "Goblin  right step 1 crop.png", "Goblin right step 2 crop.png", "Goblin left step 1 crop.png", "Goblin left step 2 crop.png", "Goblin back step 1 crop.png", "Goblin back step 2 crop.png"]
    $moving_left = false
    $frame_rate = 0
    $timer = 0
    $frame_count = 0


  end


  def draw
    super
    @background.draw(0, 0, 0, 1.5, 1.5)
    $frame_count += 1
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
    super(:image => Gosu::Image['Boat_Hole 2 crop.png'])
    @factor_x = 1.0
    @factor_y = 1.0
    @x = 385
    @y = 185
  end


end
class Goblin_enemy < Chingu::GameObject
  traits :collision_detection, :bounding_circle

  def initialize
    super(:image => Gosu::Image['Goblin crop.png'])
    @factor_x = 0.3
    @factor_y = 0.3
    @x = 450
    @y = 500


  end

  def update
    super
    @direction = rand(1..4) if $frame_count % 100 == 0
    if @direction == 1
      @x -= 3
      @image = Gosu::Image["#{$images2[4]}"] if $frame_count % 16 < 8
      @image = Gosu::Image["#{$images2[5]}"] if $frame_count % 16 >= 8
      if @x <= 0
        @direction = 2
      end
    elsif @direction == 2
      @x += 3
      @image = Gosu::Image["#{$images2[2]}"] if $frame_count % 16 < 8
      @image = Gosu::Image["#{$images2[3]}"] if $frame_count % 16 >= 8
      if @x >= $window.width
        @direction = 1
      end


    elsif @direction == 3
      @y -= 3
      @image = Gosu::Image["#{$images2[6]}"] if $frame_count % 16 < 8
      @image = Gosu::Image["#{$images2[7]}"] if $frame_count % 16 >= 8
      if @y <= 0
        @direction = 4
      end

    elsif
    @direction == 4
      @y += 3
      @image = Gosu::Image["#{$images2[0]}"] if $frame_count % 16 < 8
      @image = Gosu::Image["#{$images2[1]}"] if $frame_count % 16 >= 8
      if @y >= $window.height
        @direction = 3
      end

    end
  end

end







Rpggame.new.show