# this class defines the directions
class DirectonDefinition

  # this method checks if the direction value input from stdio is included in the valid directions or not.
  def include_direction?(direction)
    all_directions.include?(direction)
  end

  def left(direction)
    all_directions[all_directions.index(direction) - 1]
  end

  def right(direction)
    reverse_all_directions[reverse_all_directions.index(direction) - 1]
  end

  private

  # direction definition
  def all_directions
    %w(NORTH EAST SOUTH WEST)
  end

  def reverse_all_directions
    all_directions.reverse
  end
end