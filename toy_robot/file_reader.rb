class FileReader
  def initialize(robot, input_command)
    @robot, @input_command  = robot, input_command
  end

  # read commands from the command line, do not break the loop and keep accepting
  def read
    while input_command.gets
      read_command $_
    end
  end

  private

  attr_reader :robot, :input_command

  # read commands
  def read_command(cmd)
    command = cmd[read_regex, 1]
    arguments = cmd[read_regex, 2]

    case command
    when 'PLACE'
      robot.place position(read_coordinates(arguments))
    when 'MOVE'
      robot.move
    when 'LEFT'
      robot.left
    when 'RIGHT'
      robot.right
    when 'REPORT'
      robot.report
    end
  end

  # read only numbers
  def read_regex
    /([a-z]*)[ ]*(.*)/i
  end

  def read_coordinates(coordinates)
    coordinates.split(",").each do |coordinate|
      if coordinate =~ /[\d]+/
        # check if coordinate is a number
        coordinate.to_i
      else
        # direction coordinate
        coordinate
      end
    end
  end

  def position(coordinates)
    move_position = Position.new
    move_position.coordinates(coordinates)
  end
end