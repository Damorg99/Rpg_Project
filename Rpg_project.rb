require 'chingu'
class Rpggame < Chingu::Window
  def initialize
    super
    $window.caption = 'RPG test'
    @backround = Gosu::Image['Starting_area backround.png']
    Player.create.input = {holding_a: :move_left, holding_d: :move_right, holding_w: :move_up, holding_s: :move_down}
    $images =  ["Charecter back step 1 crop.png", "Charecter back step 2 crop.png", "Charecter left step 1 crop.png", "Charecter left step 2 crop.png", "Charecter right step 1 crop.png", "Charecter right step 2 crop.png", "Charecter step 1 crop.png", "Charecter step 2 crop.png" ]
    $moving_left = false
    $frame_rate = 0



  end



  def draw
    super
    @backround.draw(0,0,0,1.5,1.5)

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


Rpggame.new.show