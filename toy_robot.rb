require 'pry'
require_relative 'toy_robot/tabletop'
require_relative 'toy_robot/direction_definition'
require_relative 'toy_robot/file_reader'
require_relative 'toy_robot/position'
require_relative 'toy_robot/robot'

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
    @robot ||= Robot.new(tabletop)
  end

  # initalize parsing
  def start_file_reader
    @file_reader ||= FileReader.new(robot, input_command)
  end

  def read_file
    file_reader.read
  end

end