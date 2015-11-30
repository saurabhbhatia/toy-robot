require 'toy_robot/tabletop'
require 'toy_robot/direction_definition'
require 'toy_robot/file_reader'
require 'toy_robot/position'
require 'toy_robot/robot'

class ToyRobot

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