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

  def x_position
    position[0].to_i + movement_adjustment_x
  end

  def y_position
    position[1].to_i + movement_adjustment_y
  end

  def movement_position
    move_position = Position.new
    coordinates = Array[x_position, y_position, position[2]]
    move_position.coordinates(coordinates)
  end

  def movement_adjustment_x
    case position[2]
    when 'EAST'
      1
    when 'WEST'
      -1
    else
      0
    end
  end

  def movement_adjustment_y
    case position[2]
    when 'NORTH'
      1
    when 'SOUTH'
      -1
    else
      0
    end   
  end

  def left_turn_position
    move_position = Position.new
    move_coordinates = Array[position[0], position[1], left_turn_direction]
    move_position.coordinates(move_coordinates)
  end

  def right_turn_position
    move_position = Position.new
    move_coordinates = Array[position[0], position[1], right_turn_direction]
    move_position.coordinates(move_coordinates)
  end

  def left_turn_direction
    directions.left(position[2])
  end

  def right_turn_direction
    directions.right(position[2])
  end

  def directions
    DirectonDefinition.new
  end
end