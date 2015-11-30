class FileReader
  def initialize(robot, input_command)
    @robot, @input_command  = robot, input_command
  end

  def read
    while input_command.gets
      parse_command $_
    end
  end

  private

  attr_reader :robot, :stdin

  def read_command(cmd)
    command = cmd[read_regex, 1]
    arguments = cmd[read_regex, 2]
    case command
      robot.place 
    when 'PLACE'
    when 'MOVE'
    when 'LEFT'
    when 'RIGHT'
    when 'REPORT'
    end
  end

  def read_regex
    /([a-z]*)[ ]*(.*)/i
  end

  def position(coordinates)
    Position.new[*coordinates]
  end
end