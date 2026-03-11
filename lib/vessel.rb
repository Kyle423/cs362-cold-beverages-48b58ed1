class Vessel
  attr_reader :name, :volume, :current_volume

  def initialize(name, volume)
    @name = name
    @volume = volume
    @current_volume = 0
  end

  def empty?
    @current_volume == 0
  end

  def fill(volume = @volume)
    if (@current_volume + volume < @volume)
      @current_volume += volume
    else
      @current_volume = @volume
    end
  end

end
