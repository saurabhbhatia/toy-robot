require 'application/tabletop'
require 'application/direction_definition'
require 'application/file_reader'
require 'application/position'
require 'application/robot'

class Application

  def initialize(input_command = STDIN)
    @input_command = input_command
  end

  def start
    start_tabletop
    start_robot
    start_file_reader
    read_file
  end

  private

  attr_reader :tabletop, :robot, :file_reader, :input_command

  # initialize table top
  def start_tabletop
    @tabletop ||= Tabletop.new
  end

  # initialize robot
  def start_robot
    @robot ||= Robot.new
  end

  # initalize parsing
  def start_file_reader
    @reader = FileReader.new
  end

  def read_file
    reader.read
  end

end