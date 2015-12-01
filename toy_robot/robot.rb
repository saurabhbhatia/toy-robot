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
    # go left
    return unless placed?
    
    @position = left_turn_position
  end

  def right
    # go right
    return unless placed?
      
    @position = right_turn_position
  end

  def placed?
    # check if place is true or not
    placed
  end

  def report
    return unless placed?

    # output
    STDOUT.puts position.to_s
  end

  private

  attr_reader :tabletop, :placed

  def validate_movement_position?
    tabletop.validate_position?(movement_position)
  end

  def x_position
    # move x poisiton accoridng to the input direction
    position[0].to_i + movement_adjustment_x
  end

  def y_position
    # move y poisiton accoridng to the input direction
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
    # set coordinates for right turn position
    move_position = Position.new
    move_coordinates = Array[position[0], position[1], right_turn_direction]
    move_position.coordinates(move_coordinates)
  end

  def left_turn_direction
    # fetch direction when left position
    directions.left(position[2])
  end

  def right_turn_direction
    # fetch direction when right position
    directions.right(position[2])
  end

  def directions
    DirectonDefinition.new
  end
end