class TurnLog

  attr_reader :player, :roll, :modifier

  def initialize(params)
    @player = params[:player]
    @roll = params[:roll]
    @modifier = params[:modifier]
  end

  def modifier_type     #this is the function that defines what the modifier is 
    result = :space      #if the player stays on teh space they rolled to modifier = space
    @modifier > 0 ? result = :ladder : result = :snake #if the modifier moves the player up a space then it is of type ladder
    return result
  end
end