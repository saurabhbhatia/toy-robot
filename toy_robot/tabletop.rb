# this class creates a table top
class Tabletop

  WIDTH = 5
  HEIGHT = 5

  # this method validates the position of robot and makes sure it does not fall off the table top
  def validate_position?(input_position)
    x_position_check = input_position[0].to_i >= 0 && input_position[0].to_i < WIDTH
    y_position_check = input_position[1].to_i >= 0 && input_position[1].to_i< HEIGHT
    validate_direction = directions.include_direction?(input_position[2])
    
    x_position_check && y_position_check && validate_direction ? true : false
  end

  private 

  # initialize directions class
  def directions
    DirectonDefinition.new
  end
end