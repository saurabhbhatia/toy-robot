class Robot

  attr_reader :position

  def initialize(tabletop)
    @tabletop = tabletop
  end

  def place(position)
    if tabletop.validate_position?(position)
      @position = position
      @placed = true
    end
  end

  def move
    # check if place command has been inssued or not
    return unless placed?
    return unless validate_movement_position?
    
    @position = movement_position
  end

  def left
    return unless placed?
    
    @position = left_turn_position
  end

  def right
    return unless placed?
      
    @position = right_turn_position
  end

  def placed?
    placed
  end

  def report
    return unless placed?

    STDOUT.puts position.to_s
  end

  private

  attr_reader :tabletop, :placed

  def validate_movement_position?
    tabletop.validate_position?(movement_position)
  end

  def movement_position
    position = Position.new
    position.coordinates(x_position, y_position, position.direction)
  end

  def x_position
    position.x + movement_adjustment_x
  end

  def y_position
    position.y + movement_adjustment_y
  end

  def movement_adjustment_x
    case position.direction
    when 'EAST'
      1
    when 'WEST'
      -1
    else
      0
    end
  end

  def movment_adjustment_y
    case position.direction
    when 'NORTH'
      1
    when 'SOUTH'
      -1
    else
      0
    end   
  end

  def left_turn_position
    position = Position.new
    position.coordinates(position.x, position.y, left_turn_direction)
  end

  def right_turn_position
    position = Position.new
    position.coordinates(position.x, position.y, position.direction)
  end

  def left_turn_direction
    directions.left(position.direction)
  end

  def right_turn_direction
    directions.right(position.direction)
  end

  def directions
    DirectonDefinition.new
  end
end