class Player
  attr_reader :name, :icon
  attr_accessor :squares

  def initialize(name, icon)
    @name = name
    @icon = icon
    @squares = []
  end
end