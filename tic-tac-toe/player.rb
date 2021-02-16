class Player
  attr_reader :name, :icon, :squares

  def initialize(name, icon)
    @name = name
    @icon = icon
    @squares = []
  end
end